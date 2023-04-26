import 'package:c_movil_app/utils/global.colors.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'Login.dart';
import 'NavigationMenu.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCtZAYgK0SZpAtG7LMVI4V6l2blZAzo5M0",
      appId:
          "151348566674-hr0rmu65sn4adjgmbfeg364r669m3nj6.apps.googleusercontent.com",
      messagingSenderId: "151348566674",
      projectId: "c-movil-app",
    ),
  );

  auth = FirebaseAuth.instanceFor(app: app);

  runApp(MyApp());

  //final cameras = await availableCameras();
  //final firstCamera = cameras.first;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //final cameras = await availableCameras();
  //final firstCamera = cameras.first;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'login app',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Bienvenid@!'),
            backgroundColor: Colors.teal[600],
          ),
          //backgroundColor: GlobalColors.mainColor,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/OvZ.gif"),
                fit: BoxFit.cover,
              ),
            ),
            //child: null /* add child content here */,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20, top: 400, right: 10),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Boton Comenzar Presionado');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Login()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 15))),
                        child: Text('COMENZAR'),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
