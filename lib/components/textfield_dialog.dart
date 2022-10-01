import 'package:flutter/material.dart';


class TextFieldDialog extends StatefulWidget {
  const TextFieldDialog({super.key});

  @override
  State<TextFieldDialog> createState() => _TextFieldDialogState();
}

class _TextFieldDialogState extends State<TextFieldDialog> {
  final _textFieldController = TextEditingController();
  String? userBurmeseName;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('သင့် နာမည် အစ စာလုံးများအား မြန်မာလို ရိုက်ထည့်ပါ'),
      content: TextField(
        controller: _textFieldController,
        onChanged: (value) {
          userBurmeseName = value;
        },
      ),
      actions: [
        TextButton(
          child: const Text('အိုကေ'),
          onPressed: () {
            Navigator.pop(context, userBurmeseName);
          },
        )
      ],
    );
  }
}
