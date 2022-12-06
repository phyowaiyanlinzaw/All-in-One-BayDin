import 'package:flutter/material.dart';
import 'package:know_my_zodiac_sign/utilities/constants.dart';

class ErrorDialog{
  static void errorDialog({required BuildContext ctx,required String error}){
    showDialog(
        context: ctx,
        builder: (context){
          return AlertDialog(
            title: const Center(
              child: Text(
                'ERROR',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 30,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  error,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.canPop(context)?Navigator.pop(context):null;
                  },
                  child: const Text(
                    'OK',
                  ))
            ],
          );
        });
  }
}
