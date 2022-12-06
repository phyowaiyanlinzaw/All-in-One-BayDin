import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xff25294A);
const kSecondaryColor = Color(0xff2D325A);
const kWhiteColor = Color(0xffE9EBF9);

const kCardColor = Color(0xff2D325A);
const kIconSize = 80.0;

const kTextInsideCardTextStyle = TextStyle(
  fontSize: 20,
  color: Color(0xffE9EBF9),
);
const kIconColor = Color(0xffE9EBF9);

const kTextOnButtonStyle =
    TextStyle(color: Color(0xff25294A), fontWeight: FontWeight.w500);

const kTextTheme = TextTheme(bodyText1: TextStyle(color: Color(0xFF191919)));

const kLogInLogoText = Text(
  'ALL-in-1NE-BaYDiN',
  style: TextStyle(
      color: kWhiteColor,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 40),
);

const kErrorInitializeText = Text(
  'Something went wrong.',
  style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 40),
);

const kTextOnDateButton = Text(
  'Click to select your birthday',
  style: TextStyle(color: Color(0xFF191919)),
);
const kTextOnLogInButton = Text('ENTER');

const kReadingTextStyle =
    TextStyle(color: Color(0xffE9EBF9), letterSpacing: 1, fontSize: 18);

const kUserNameTextStyle = (TextStyle(
    color: Color(0xffE9EBF9),
    fontWeight: FontWeight.w500,
    fontSize: 20,
    decoration: TextDecoration.underline));
