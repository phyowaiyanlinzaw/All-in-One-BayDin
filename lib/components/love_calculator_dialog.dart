import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

class LoveCalculatorDialog extends StatefulWidget {
  final String result;

  // ignore: use_key_in_widget_constructors
  const LoveCalculatorDialog({required this.result});

  @override
  State<LoveCalculatorDialog> createState() => _LoveCalculatorDialogState();
}

class _LoveCalculatorDialogState extends State<LoveCalculatorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        height: 100,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${widget.result}%"),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'))
          ],
        ),
      ),
    );
  }
}
