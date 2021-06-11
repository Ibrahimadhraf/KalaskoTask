
import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
 final double? space;

  VerticalSpace({this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:space,
    );
  }
}
