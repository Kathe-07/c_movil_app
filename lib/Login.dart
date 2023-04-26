import 'package:c_movil_app/Register.dart';
import 'package:c_movil_app/utils/button.global.dart';
import 'package:c_movil_app/utils/global.colors.dart';
import 'package:c_movil_app/utils/social.login.dart';
import 'package:c_movil_app/utils/text.form.global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NavigationMenu.dart';

import 'package:c_movil_app/utils/global.colors.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'NavigationMenu.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class Preferences {
  Future<void> guardarNombre(String nombre) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('nombre', nombre);

    Future<String?> obtenerNombre() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? nombre = preferences.getString('nombre');
      return nombre;
    }
  }
}

class LoginApp extends State<Login> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _errorMessage = '';

  Future<bool> validateState() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot user = await ref.get();

      if (user.docs.isNotEmpty) {
        for (var cursor in user.docs) {
          if (cursor.get('usuario') == usuarioController.text) {
            print('Usuario Encontrado');
            print(cursor.get('documento'));
            if (cursor.get('password') == passwordController.text) {
              print('********************Login_Exitoso********************');
              print('Estado -->' + cursor.get('estado'));
              return true;
            }
          } else {
            setState(() {
              _errorMessage =
                  'Usuario y/o Contraseña incorrectos, por favor intenta nuevamente.';
            });
          }
        }
        return false;
      } else {
        print('No hay documentos en la coleccion');
        return false;
      }
    } catch (e) {
      setState(() {
        _errorMessage =
            'Hubo un error al iniciar sesión, por favor intenta nuevamente.';
      });
      print('ERROR....$e');
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCtZAYgK0SZpAtG7LMVI4V6l2blZAzo5M0",
        appId:
            "151348566674-hr0rmu65sn4adjgmbfeg364r669m3nj6.apps.googleusercontent.com",
        messagingSenderId: "151348566674",
        projectId: "c-movil-app",
      ),
    );
  }

  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          key: formGlobalKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Container(
                  width: 100,
                  height: 200,
                  child: Image.asset("assets/images/YIgS.gif"),
                ),
              ),
            ),
            TextFormField(
              controller: usuarioController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Correo electrónico',
                hintText: 'Ingresa tu Correo electronico o Usuario',
              ),
              validator: (usuarioController) {
                if (usuarioController == null || usuarioController!.isEmpty) {
                  return 'Por favor ingresa un usuario.';
                }
                return null;
              },
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Contraseña',
                hintText: 'Ingresa tu contraseña',
              ),
              validator: (passwordController) {
                if (passwordController!.isEmpty) {
                  return 'Por favor ingresa una contraseña.';
                } else if (passwordController.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres.';
                }
                return null;
              },
            ),

            //Boton ingresar
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // final preferences = Preferences();
                    //preferences.guardarNombre(usuarioController.text);
                    print('Boton de login presionado');
                    print('Cargando....');
                    if (await validateState()) {
                      print('Ha ingresado correctamente....');
                      if (context.mounted) {
                        String correo = usuarioController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    NavigationMenu(correo: correo)));
                      }
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 15))),
                  child: Text('Iniciar Sesion'),
                ),
              ),
            ),
            const SizedBox(height: 50),
            if (_errorMessage.isNotEmpty) ...[
              const SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],

            const SizedBox(height: 50),

            InkWell(
              onTap: () {
                print("oprpimir olvidar");
              },
              child: SizedBox(
                height: 30,
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                  ),
                ),
              ),
            ),

            //const SizedBox(height: 25),
            const SocialLogin(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Si no estas registrad@ ',
            ),
            InkWell(
              child: Text(
                'registrate aqui',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                ),
              ),
              onTap: () {
                print('Registration');
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Register()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
