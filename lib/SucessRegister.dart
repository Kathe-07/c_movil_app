import 'package:flutter/material.dart';

import 'Login.dart';

class sucessRegister extends StatefulWidget {
  @override
  sucessRegisterApp createState() => sucessRegisterApp();
}

class sucessRegisterApp extends State<sucessRegister> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Exitoso'),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Container(
                  width: 300,
                  height: 100,
                  child: Image.asset("assets/images/icons8-subscribe.gif"),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, top: 100, right: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Boton Comenzar Presionado');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: Text('Volver a Login'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
