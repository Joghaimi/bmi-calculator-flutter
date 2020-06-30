import 'package:flutter/material.dart';
import 'Constant.dart';
import 'BottomButton.dart';
class BottomButton extends StatelessWidget {
  BottomButton(this.onTab,this.ButtoTitel);
  final Function onTab;
  final ButtoTitel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(child: Text(ButtoTitel,style: largeButtonTextStyle,)),
        color:Pink ,
        margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: double.infinity,
        height: 40,
      ),
      onTap: onTab,
    );
  }
}
