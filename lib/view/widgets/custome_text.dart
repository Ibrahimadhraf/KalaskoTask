import 'package:flutter/material.dart';

class CostumeText extends StatelessWidget {
  final double? fontSize;
  final String? text;
  final Color? color;
  final int? maxLine;
  final double? height;

  CostumeText(
      {this.fontSize, this.text, this.color, this.maxLine, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        maxLines: maxLine == null ? 1 : maxLine,
        style: TextStyle(
          height: height == null ? 1 : height,
          color: color == null ? Colors.black : color,
          fontSize: fontSize,
        ));
  }
}
