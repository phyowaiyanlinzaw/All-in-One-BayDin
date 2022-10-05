import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/components/ask_anything_dialog.dart';
import 'package:know_my_zodiac_sign/screens/ask_anything_page.dart';
import 'package:know_my_zodiac_sign/screens/love_calculator_page.dart';
import 'package:know_my_zodiac_sign/screens/person_type_page.dart';
import 'package:know_my_zodiac_sign/screens/screen_chooser_page.dart';
import 'package:know_my_zodiac_sign/services/love_calculator.dart';
import 'utilities/constants.dart';
import 'screens/user_info_page.dart';

void main() {
  runApp(KnowYourZodiac());
}

class KnowYourZodiac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: kPrimaryColor,
              secondary: kSecondaryColor,
            ),
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: kTextTheme),
        debugShowCheckedModeBanner: false,
        home: UserInfoPage(),	
		);

  }
}
