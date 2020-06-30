import 'package:flutter/material.dart';
import 'Constant.dart';


class IconCard extends StatelessWidget {

  IconCard(this.icon,this.text);
  final  icon;
  final String text;
  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: gabHight,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color:cardColor,
          ),
        ),
      ],
    );
  }
}