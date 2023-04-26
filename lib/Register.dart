import 'package:c_movil_app/utils/button.registration.dart';
import 'package:c_movil_app/utils/global.colors.dart';
import 'package:c_movil_app/utils/text.form.global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'SucessRegister.dart';

class Register extends StatefulWidget {
  @override
  RegisterApp createState() => RegisterApp();
}

class RegisterApp extends State<Register> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController documentoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  userRegister() async {
    try {
      await firebase.collection('Users').doc().set({
        "usuario": usuarioController.text,
        "documento": documentoController.text,
        "nombre": nombreController.text,
        "apellido": apellidoController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "estado": "Activo",
      });
    } catch (e) {
      print('ERROR....' + e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: usuarioController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                hintText: 'Ingresa tu nombre de usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: documentoController,
              decoration: InputDecoration(
                labelText: 'Documento',
                hintText: 'Ingresa tu documento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: apellidoController,
              decoration: InputDecoration(
                labelText: 'Apellido',
                hintText: 'Ingresa tu apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Ingresa tu email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Ingresa tu password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                print('Enviando...');
                userRegister();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => sucessRegister()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)),
              child: Text('Enviar datos'),
            ),
          ),
        ],
      )),
    );
  }
}
