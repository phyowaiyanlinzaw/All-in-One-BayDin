import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:know_my_zodiac_sign/UserState.dart';
import 'package:know_my_zodiac_sign/components/error_dialog.dart';
import 'package:know_my_zodiac_sign/components/reusable_card.dart';
import 'package:know_my_zodiac_sign/screens/user_info_page.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/components/card_content.dart';
import 'package:know_my_zodiac_sign/screens/zodiac_reading_page.dart';
import 'package:know_my_zodiac_sign/screens/person_type_page.dart';
import 'package:know_my_zodiac_sign/screens/ask_anything_page.dart';
import 'package:know_my_zodiac_sign/screens/love_calculator_page.dart';

class ScreenChooserPage extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _logOut (context){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            backgroundColor: kPrimaryColor,
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.logout,
                    color: kWhiteColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'LOGGING OUT',
                    style: TextStyle(
                      color: kWhiteColor,
                    ),
                  ),
                )
              ],
            ),
            content: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Text(
                'DO YOU WANT TO LOG OUT OF YOUR ACCOUNT?',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kCardColor
                  ),
                    onPressed: (){
                    _auth.signOut();
                    Navigator.canPop(context)?Navigator.pop(context):null;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>UserState()));
                    },
                    child: const Text(
                      'YES',
                      style: TextStyle(
                        color: kIconColor,
                        fontSize: 20,
                      ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kCardColor
                  ),
                  onPressed: (){
                    Navigator.canPop(context)?Navigator.pop(context):null;
                  },
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: kIconColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          );
        }
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                _logOut(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoPage()));
              },
              icon: const Icon(
                Icons.logout,
                color: kWhiteColor,
              )
          )
        ],
        centerTitle: true,
        title: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
          stream: FirebaseFirestore.instance.collection('users').where('name',isNull: false).snapshots(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(color: kWhiteColor,));
            }else if(snapshot.connectionState ==ConnectionState.active)
              {
                if(snapshot.data.docs.isNotEmpty == true) {
                  return Text(
                      snapshot.data?.docs[0]['name']
                  );
                }
                else
                  {
                    return const Text(
                      'Hello, Unnamed User.'
                    );
                  }
              }
            return const Text(
              'Something went wrong.'
            );
          },
        )
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
                                    ZodiacReadingPage()));
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
                                builder: (builder) => PersonTypePage()));
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
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoveCalculatorPage(),
                          ),
                        );
                      },
                      color: kCardColor,
                      cardChild: CardContent(
                        image: 'images/love.png',
                        text: 'LOVE CALCULATOR',
                      ),
                    ),
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
