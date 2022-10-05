import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/services/love_calculator.dart';
import 'package:know_my_zodiac_sign/components/text_input.dart' as textinput;
import 'package:know_my_zodiac_sign/components/love_calculator_dialog.dart';

class LoveCalculatorPage extends StatefulWidget {
  const LoveCalculatorPage({super.key});

  @override
  State<LoveCalculatorPage> createState() => _LoveCalculatorPageState();
}

class _LoveCalculatorPageState extends State<LoveCalculatorPage> {
  String? firstPersonName;
  String? secondPersonName;

  String getLoveCalculationResult() {
    firstPersonName = firstPersonName!.replaceAll(" ", "");
    secondPersonName = secondPersonName!.replaceAll(" ", "");
    String result =
        LoveCalculator.loveCalculator(firstPersonName!, secondPersonName!);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textinput.TextInput(
              hint: 'First Person Name',
              onChanged: (value) {
                firstPersonName = value;
              },
            ),
            GestureDetector(
              onTap: () {
                firstPersonName == null && secondPersonName == null
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Names can\'t be empty'),
                        ),
                      )
                    : showDialog(
                        context: context,
                        builder: (_) => LoveCalculatorDialog(
                          result: getLoveCalculationResult(),
                        ),
                      );
              },
              child: Stack(
                children: const [
                  Center(
                    child: Icon(
                      Icons.favorite,
                      color: kWhiteColor,
                      size: 110,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        'CALCULATE',
                        style: kTextOnButtonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            textinput.TextInput(
              hint: 'Second Person Name',
              onChanged: (value) {
                secondPersonName = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
