
import 'dart:async';

import 'package:c_movil_app/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'Login.dart';

class SplashView extends StatelessWidget {
  const SplashView( {super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      //Get.to(LoginView());
      Get.to(() => Login());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Image.asset(
          'assets/images/logoFinal.png',
          //height: 200.0,
        ),
      ),
    );
  }
}
