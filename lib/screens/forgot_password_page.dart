import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/components/error_dialog.dart';
import 'package:know_my_zodiac_sign/screens/log_in_page.dart';

import '../utilities/constants.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController _emailTextController = TextEditingController(text: '');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  void _forgotPasswordFunction() async{
    setState(() {
      _isLoading = true;
    });
    try{
      await _auth.sendPasswordResetEmail(
          email: _emailTextController.text.trim()
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogInPage()));
    }
    catch(error){
      setState(() {
        _isLoading = false;
      });
      ErrorDialog.errorDialog(ctx: context, error: error.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 5),
          child: ListView(
            children: [
              Column(
                children: [
                  kLogInLogoText,
                  const SizedBox(height: 14,),
                  Image.asset('images/8ball.png',)
                  ],
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                  'Please enter your email below to get a password reset link.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 25,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                ),
                cursorColor: kWhiteColor,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: kWhiteColor,
                          width: 2.5
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: kWhiteColor,
                            width: 1.5
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: kWhiteColor,
                            width: 2.5
                        )
                    ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _isLoading?
              Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(
                    color: kWhiteColor,
                  ),
                ),
              ):
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                      shape: const CircleBorder(
                          side: BorderSide(
                              color: kWhiteColor,
                              width: 3.5
                          )
                      )
                  ),
                  onPressed: () {
                    _forgotPasswordFunction();

                  },
                  child: const Text(
                    'RESET',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
              )
            ],
    ),
     ),
)
                   );
  }
}
