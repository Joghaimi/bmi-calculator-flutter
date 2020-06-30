import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  reusableCard(@required this.colour,this.childcard,[this.onPress]);
  final Color colour;
  final Widget childcard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress ,
      child: Container(
        margin:EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:colour,
        ),
        child: childcard,
      ),
    );
  }
}