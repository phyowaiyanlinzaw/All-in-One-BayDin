import 'package:flutter/material.dart';
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
        home: UserInfoPage());
  }
}
