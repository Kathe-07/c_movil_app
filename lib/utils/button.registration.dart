import 'dart:developer';

import 'package:flutter/material.dart';

import '../Register.dart';
import 'global.colors.dart';

class ButtonRegistration extends StatelessWidget {
  const ButtonRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RegisterApp();
        print('Registro exitoso');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: GlobalColors.mainColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              ),
            ]),
        child: const Text(
          'Enviar',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.teal),
        ),
      ),
    );
  }
}
