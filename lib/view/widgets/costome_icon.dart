
import 'package:flutter/material.dart';

class CostumeIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double iconSize;
  final Function onPress;
  CostumeIcon(this.icon, this.color,this.iconSize ,this.onPress);

  @override
  Widget build(BuildContext context) {
    return  IconButton(icon:Icon(icon), onPressed: () => onPress  ,color: color, iconSize: iconSize,);
  }
}
