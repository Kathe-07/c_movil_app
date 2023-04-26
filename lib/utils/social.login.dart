import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'global.colors.dart';

class SocialLogin extends StatefulWidget{
  const SocialLogin({super.key});


  @override
  SocialLoginApp createState() =>SocialLoginApp();

}

class SocialLoginApp extends State<SocialLogin>{
static Future<User?> iniciarSesion({required BuildContext context}) async{
  FirebaseAuth authenticator = FirebaseAuth.instance;
  User? user;

  GoogleSignIn objGoogleSignIn = GoogleSignIn(clientId:'151348566674-hr0rmu65sn4adjgmbfeg364r669m3nj6.apps.googleusercontent.com');
  GoogleSignInAccount? objGoogleSignInAccount = await objGoogleSignIn.signIn();

  if(objGoogleSignInAccount != null){
    GoogleSignInAuthentication objGoogleSignInAuthentication = await objGoogleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(

      accessToken: objGoogleSignInAuthentication.accessToken,
      idToken: objGoogleSignInAuthentication.idToken
    );
    try{
      UserCredential userCredential = await authenticator.signInWithCredential(credential);
      user=userCredential.user;
      return user;
          
  }on FirebaseAuthException catch(e){
      print("Error en la autenticacion");

    }
  }

}





//class SocialLogin extends StatelessWidget {
  //const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'Si ya estas registrado, ingresa con ',
            style: TextStyle(
              color: GlobalColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              ////Google
              Expanded(
                child: ElevatedButton(
                onPressed: () async{
                  User? user = await SocialLoginApp.iniciarSesion(context: context);
                  print(user?.displayName);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child:
                  SvgPicture.asset('assets/images/google.svg', height: 30),
                ),
                ),
              ),

              const SizedBox(width: 15),
              ////Facebook
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    height: 30,
                  ),

                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
