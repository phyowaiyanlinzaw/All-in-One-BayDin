import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:know_my_zodiac_sign/components/ask_anything_dialog.dart';

class AskAnythingPage extends StatefulWidget {
  const AskAnythingPage({super.key});

  @override
  State<AskAnythingPage> createState() => _AskAnythingPageState();
}

class _AskAnythingPageState extends State<AskAnythingPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ask Anything',
              style: kTextInsideCardTextStyle,
            ),
            const Text(
              '&',
              style: kReadingTextStyle,
            ),
            const Text(
              'Tap the Ball',
              style: kTextInsideCardTextStyle,
            ),
            GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context, builder: (_) => AskAnythingDialog());
              },
              child: Image.asset(
                'images/8ball.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
