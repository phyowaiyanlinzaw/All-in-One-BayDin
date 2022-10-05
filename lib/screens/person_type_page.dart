import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:know_my_zodiac_sign/components/textfield_dialog.dart';
import 'package:know_my_zodiac_sign/services/person_type_analyzer.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/components/image_dialog.dart';

class PersonTypePage extends StatefulWidget {
	
  @override
  State<PersonTypePage> createState() => _PersonTypePageState();
}

class _PersonTypePageState extends State<PersonTypePage> {
  String? userBurmeseInitials;

  String getPersonType(String inputName) {
    String personType = PersonTypeAnalyzer().getPersonType(inputName);
    return personType;
  }

  Future<void> showTextFieldDialog() async {
    userBurmeseInitials = await showDialog(
        context: context,
        builder: (builder) {
          return const TextFieldDialog();
        });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => showTextFieldDialog());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userBurmeseInitials?.toString() != null
                    ? userBurmeseInitials!
                    : 'သင့်နာမည်',
                style: kUserNameTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  userBurmeseInitials?.toString() != null
                      ? getPersonType(userBurmeseInitials!)
                      : 'သင့်နာမည်',
                  style: kReadingTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await showDialog(
                      context: context, builder: (_) => ImageDialog());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: Colors.white),
                child: const Text(
                  'အလုပ်လုပ်ပုံကို သိရှိရန် နှိပ်ပါ',
                  style: kTextOnButtonStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
