import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/components/error_dialog.dart';
import 'package:know_my_zodiac_sign/screens/forgot_password_page.dart';

import '../utilities/constants.dart';

class LogInPage extends StatefulWidget {

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController(text: '');
  final TextEditingController _pwTextController = TextEditingController(text: '');

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _pwFocusNode = FocusNode();

  bool _obscureText = true;
  bool _isLoading = false;

  void _loginButtonFunction() async{
    final _isValid = _loginFormKey.currentState!.validate();
    if(_isValid){
      setState(() {
        _isLoading = true;
      });
      try{
        await _auth.signInWithEmailAndPassword(
            email: _emailTextController.text.trim().toLowerCase(),
            password: _pwTextController.text.trim());
        Navigator.canPop(context)?Navigator.pop(context):null;
      }
      catch(error){
        setState(() {
          _isLoading = false;
        });
        ErrorDialog.errorDialog(ctx: context, error: error.toString());
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _pwFocusNode.dispose();
    _pwTextController.dispose();
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
                height: 40,
              ),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocusNode,
                      onEditingComplete: ()=>FocusScope.of(context).requestFocus(_pwFocusNode),
                      validator: (value){
                        if(value!.isEmpty||!value.contains('@')){
                          return 'Please enter a valid email address.';
                        }
                        else{
                          return null;
                        }
                      },
                      cursorColor: kWhiteColor,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          hintText: 'EMAIL',
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
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2.5
                              ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _pwTextController,
                      focusNode: _pwFocusNode,
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.go,

                      validator: (value){
                        if(value!.length<8||value.isEmpty){
                          return 'Please enter a valid password.';
                        }else{
                          return null;
                        }
                      },

                      cursorColor: kWhiteColor,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: _obscureText?
                            const Icon(Icons.visibility,color: kWhiteColor,):
                            const Icon(Icons.visibility_off,color: kWhiteColor,)
                          ),
                          hintText: 'PASSWORD',
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
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2.5
                              ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordPage()));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontStyle: FontStyle.italic,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _isLoading?
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        child: const CircularProgressIndicator(
                          color: kWhiteColor,
                        ),
                      ),
                    ):
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
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
                          _loginButtonFunction();
                        },
                        child: const Text(
                          'GO',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
