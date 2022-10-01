import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

class ZodiacReadingCard extends StatelessWidget {
  final Widget cardChild;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ZodiacReadingCard({required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
