import 'package:flutter/material.dart';
import 'my_text_field.dart';
class MyAlertDialog extends StatelessWidget {

  Function named;
  Function aged;
  Function onTap;
  String textFirst;
  String textSecond;
  String errorNamed;
  String errorAged;
  TextEditingController namedController;
  TextEditingController agedController;

  MyAlertDialog({this.named, this.aged, this.onTap, this.textSecond, this.textFirst, this.agedController, this.namedController, this.errorNamed, this.errorAged});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(textFirst),
          MyTextField(focus: true, hint: 'Name', inputType: TextInputType.name, myText: named, textEditingController: namedController, error: errorNamed,),
          MyTextField(focus: true,hint: 'Age', inputType: TextInputType.number, myText: aged, textEditingController: agedController, error: errorAged,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(onPressed: onTap, child: Text(textSecond)),
              FlatButton(onPressed: () => Navigator.pop(context), child: Text('Back')),
            ],
          ),
        ],
      ),
    );
  }
}
