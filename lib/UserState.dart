import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/screens/screen_chooser_page.dart';
import 'package:know_my_zodiac_sign/screens/sign_up_page.dart';
import 'package:know_my_zodiac_sign/screens/welcome_screen.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

class UserState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,userSnapShot){
        if(userSnapShot.data == null){
          return WelcomePage();
        }
        else if(userSnapShot.hasData){
          return ScreenChooserPage();
        }
        else if(userSnapShot.hasError){
          return const Scaffold(
            body: Center(
              child: kErrorInitializeText,
            ),
          );
        }
        else if(userSnapShot.connectionState == ConnectionState.waiting){
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: kErrorInitializeText,
          )
        );
      },
    );
  }
}
