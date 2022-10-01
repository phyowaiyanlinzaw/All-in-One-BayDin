import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/services/answers_randomizer.dart';

class AskAnythingDialog extends StatefulWidget {
  @override
  State<AskAnythingDialog> createState() => _AskAnythingDialogState();
}

class _AskAnythingDialogState extends State<AskAnythingDialog> {
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
            Text(AnswerRandomizer().answerRandomizer()),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Lee Button'))
          ],
        ),
      ),
    );
  }
}
