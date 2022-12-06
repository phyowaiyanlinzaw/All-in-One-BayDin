import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/UserState.dart';
import 'package:know_my_zodiac_sign/components/ask_anything_dialog.dart';
import 'package:know_my_zodiac_sign/screens/ask_anything_page.dart';
import 'package:know_my_zodiac_sign/screens/love_calculator_page.dart';
import 'package:know_my_zodiac_sign/screens/person_type_page.dart';
import 'package:know_my_zodiac_sign/screens/screen_chooser_page.dart';
import 'package:know_my_zodiac_sign/services/love_calculator.dart';
import 'utilities/constants.dart';
import 'screens/sign_up_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(KnowYourZodiac());
}

class KnowYourZodiac extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: kPrimaryColor,
              body: Center(
                child: kLogInLogoText
              ),
            ),
          );
        }
        else if(snapshot.hasError){
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: kErrorInitializeText,
              ),
            ),
          );
        }
        return MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: kPrimaryColor,
                secondary: kSecondaryColor,
              ),
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: kTextTheme),
          debugShowCheckedModeBanner: false,
          home: UserState(),
        );
      },

    );

  }
}
