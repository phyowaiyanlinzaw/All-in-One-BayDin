import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/components/text_input.dart';
import 'package:know_my_zodiac_sign/components/date_picker.dart';
import 'screen_chooser_page.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class UserInfoPage extends StatefulWidget {
  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String? selectedDate;

  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kLogInLogoText,
            const SizedBox(
              height: 30,
            ),
            TextInput(
              hint: 'Enter Your Name Here',
              onChanged: (value) {
                userName = value;
              },
            ),
            //   SelectedDatePicker(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: kPrimaryColor,
                    backgroundColor: kWhiteColor,
                    textStyle: kTextOnButtonStyle),
                onPressed: () async {
                  selectedDate = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SelectedDatePicker();
                      });
                  setState(() {});
                },
                child: selectedDate == null
                    ? kTextOnDateButton
                    : Text(selectedDate!),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kWhiteColor, width: 1.0),
                      foregroundColor: kWhiteColor,
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder()),
                  onPressed: () {
                    if (selectedDate != null && userName != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) =>
                                  ScreenChooserPage(selectedDate!, userName)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User Infos can\'t be empty'),
                        ),
                      );
                    }
                  },
                  child: kTextOnLogInButton),
            ),
          ],
        ),
      ),
    );
  }
}
