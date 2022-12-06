import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:know_my_zodiac_sign/services/zodiac_analyzer.dart';
import 'package:know_my_zodiac_sign/components/zodiac_reading_card.dart';
import 'package:know_my_zodiac_sign/components/card_content.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class ZodiacReadingPage extends StatefulWidget {

  @override
  State<ZodiacReadingPage> createState() => _ZodiacReadingPageState();
}

class _ZodiacReadingPageState extends State<ZodiacReadingPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  dynamic data;
  DocumentSnapshot? snapshot;

  String? selectedDate;

  String? zodiacName;
  String? zodiacReading;

  void getZodiac() {
    var firebaseUser = _auth.currentUser;
    FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).get().then((value) {
      setState(() {
        selectedDate = value.data()!['birthday'];
      });
      zodiacName = ZodiacAnalyzer().analyzeDate(selectedDate!)[0];
      zodiacReading = ZodiacAnalyzer().analyzeDate(selectedDate!)[1];
    });
  }

  @override
  void initState() {
    super.initState();
    getZodiac();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ZodiacReadingCard(
                  cardChild: CardContent(
                      image: 'images/$zodiacName.png',
                      text: zodiacName.toString().toUpperCase()),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  zodiacReading.toString(),
                  style: GoogleFonts.fredokaOne(textStyle: kReadingTextStyle),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
