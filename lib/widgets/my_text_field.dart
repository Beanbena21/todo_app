import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  TextInputType inputType;
  bool focus;
  String hint;
  String error;
  Function myText;
  TextEditingController textEditingController;
  MyTextField({this.inputType, this.focus, this.hint, this.myText, this.textEditingController, this.error});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: myText,
      autofocus: focus,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        errorText: error,
      ),

    );
  }
}