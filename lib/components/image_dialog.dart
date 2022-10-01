import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Image.asset(
      'images/howdoesitwork.jpg',
      width: 500,
      height: 550,
    ));
  }
}
