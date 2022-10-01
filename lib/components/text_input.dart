import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final String hint;
  final ValueChanged onChanged;

  // ignore: use_key_in_widget_constructors
  TextInput({required this.hint, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
		style: const TextStyle(
			color: kWhiteColor
		),
        onChanged: onChanged,
        cursorColor: kWhiteColor,
        decoration: InputDecoration(
          focusColor: kWhiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: kWhiteColor, width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: kWhiteColor)),
          prefixIcon: const Icon(
            Icons.account_circle,
            color: kWhiteColor,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }
}
