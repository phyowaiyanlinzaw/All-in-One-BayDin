import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

class CardContent extends StatelessWidget {

  CardContent({required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: kTextInsideCardTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
