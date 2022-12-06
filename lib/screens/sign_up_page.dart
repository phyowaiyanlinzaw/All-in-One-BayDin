import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/components/error_dialog.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';
import 'package:know_my_zodiac_sign/components/text_input.dart';
import 'package:know_my_zodiac_sign/components/date_picker.dart';
import 'screen_chooser_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _emailTextController = TextEditingController(text: '');
  final TextEditingController _userNameTextController = TextEditingController(text: '');
  final TextEditingController _pwTextController = TextEditingController(text: '');

  final FocusNode _pwFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();

  final _globalFormKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _selectedDate = '';
  bool _isLoading = false;
  bool _isObscure = true;

  void submitFormOnSignUp() async{
    bool isValid = _globalFormKey.currentState!.validate();
    if(isValid){
      setState(() {
        _isLoading = true;
      });
      try{
        await _auth.createUserWithEmailAndPassword(
            email: _emailTextController.text.trim().toLowerCase(),
            password: _pwTextController.text.trim());

        final User? currentUser = _auth.currentUser;
        final uid = currentUser!.uid;

        FirebaseFirestore.instance.collection('users').doc(uid).set(
          {
            'id':uid,
            'name':_userNameTextController.text,
            'email':_emailTextController.text,
            'birthday':_selectedDate,
            'createdAt':Timestamp.now()
          }
        );
        Navigator.canPop(context)?Navigator.pop(context):null;
      }catch(error){
        ErrorDialog.errorDialog(ctx: context, error: error.toString());
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
  _emailTextController.dispose();
  _pwTextController.dispose();
  _pwFocusNode.dispose();
  _emailFocusNode.dispose();
  _userNameTextController.dispose();
  _userNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 26),
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
                key: _globalFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: kWhiteColor,

                      focusNode: _emailFocusNode,
                      onEditingComplete: ()=>FocusScope.of(context).requestFocus(_userNameFocusNode),
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value!.isEmpty||!value.contains('@')){
                          return 'Please enter a valid email address.';
                        }else{
                          return null;
                        }
                      },
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: 'YOUR EMAIL',
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
                      height: 12,
                    ),
                    TextFormField(
                      controller: _userNameTextController,
                      focusNode: _userNameFocusNode,
                      onEditingComplete: ()=> FocusScope.of(context).requestFocus(_pwFocusNode),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your real name.';
                        }else{
                          return null;
                        }
                      },
                      cursorColor: kWhiteColor,
                      autofocus: false,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20
                      ),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Colors.grey
                        ),
                          hintText: 'YOUR NAME',
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
                      height: 12,
                    ),
                    TextFormField(
                      cursorColor: kWhiteColor,
                      obscureText: _isObscure,
                      focusNode: _pwFocusNode,
                      controller: _pwTextController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value){
                        if(value!.isEmpty||value.length<7){
                          return 'Please enter a valid password longer than 7 words.';
                        }else{
                          return null;
                        }
                      },
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          child: _isObscure ?
                          const Icon(Icons.visibility,color: kWhiteColor,):
                          const Icon(Icons.visibility_off,color: kWhiteColor,)
                        ),
                          hintText: 'YOUR PASSWORD',
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
                        onPressed: () async {
                          _selectedDate = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SelectedDatePicker();
                              });
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'SELECT YOUR BIRTHDAY HERE',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _isLoading
                        ? Center(
                      // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 20,
                            width: 20,
                              child: const CircularProgressIndicator(
                                color: kWhiteColor,
                              ),
                      ),
                    ) : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 80),
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: kWhiteColor,
                            width: 3.5
                          )
                        )
                      ),
                      onPressed: () {
                        submitFormOnSignUp();
                      },
                      child: const Text(
                        'GO',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),

                    )
                  ],
                ),
              )
              // kLogInLogoText,
              // const SizedBox(
              //   height: 30,
              // ),
              // TextInput(
              //   hint: 'Enter Your Name Here',
              //   onChanged: (value) {
              //     userName = value;
              //   },
              // ),
              // //   SelectedDatePicker(),
              // Container(
              //   margin: const EdgeInsets.only(top: 10),
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         foregroundColor: kPrimaryColor,
              //         backgroundColor: kWhiteColor,
              //         textStyle: kTextOnButtonStyle),

              //     child: selectedDate == null
              //         ? kTextOnDateButton
              //         : Text(selectedDate!),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 10),
              //   child: OutlinedButton(
              //       style: OutlinedButton.styleFrom(
              //           side: const BorderSide(color: kWhiteColor, width: 1.0),
              //           foregroundColor: kWhiteColor,
              //           backgroundColor: kPrimaryColor,
              //           shape: const StadiumBorder()),
              //       onPressed: () {
              //         if (selectedDate != null &&
              //             (userName?.isNotEmpty ?? false)) {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (builder) =>
              //                       ScreenChooserPage()));
              //         } else {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(
              //               content: Text('User Infos can\'t be empty'),
              //             ),
              //           );
              //         }
              //       },
              //       child: kTextOnLogInButton),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
