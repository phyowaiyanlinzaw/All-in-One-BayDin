import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/components/reusable_card.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/components/card_content.dart';
import 'package:know_my_zodiac_sign/screens/zodiac_reading_page.dart';
import 'package:know_my_zodiac_sign/screens/personal_type_page.dart';
import 'package:know_my_zodiac_sign/screens/ask_anything_page.dart';

class ScreenChooserPage extends StatelessWidget {
  final String selectedDate;
  final String? userName;

  ScreenChooserPage(this.selectedDate, this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: userName == null
            ? const Text('Welcome, Unnamed User')
            : Text('Welcome, $userName'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    ZodiacReadingPage(selectedDate)));
                      },
                      color: kCardColor,
                      cardChild: CardContent(
                        image: 'images/crystal_ball.png',
                        text: 'KNOW YOUR ZODIAC',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => PersonalTypePage()));
                      },
                      color: kCardColor,
                      cardChild: CardContent(
                        image: 'images/who.png',
                        text: 'READING BASED ON YOUR NAME',
                      )),
                )
              ],
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {},
                        color: kCardColor,
                        cardChild: CardContent(
                          image: 'images/love.png',
                          text: 'LOVE CALCULATOR',
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AskAnythingPage()));
                        },
                        color: kCardColor,
                        cardChild: CardContent(
                          image: 'images/8ball.png',
                          text: 'ASK ANYTHING',
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
