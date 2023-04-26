import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  String correo;
  MyHeaderDrawer({super.key, required this.correo});

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[600],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/bot.png'),
              ),
            ),
          ),
          const Text(
            "Bienvenid@",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            widget.correo,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
