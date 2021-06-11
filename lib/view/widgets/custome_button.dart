

import 'package:flutter/material.dart';
import 'package:flutter_task/view/widgets/custome_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;

  final Color? color;
  final Color? textColor;
  final onPress;

  CustomButton({
    required this.onPress,
    this.text = 'Write text ',
    this.color ,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      color:color,
      child: Container(
        alignment: Alignment.center ,
        child: CostumeText(
          text: text,
          color:textColor==null? Colors.white:textColor,
        ),
      ),
    );
  }
}