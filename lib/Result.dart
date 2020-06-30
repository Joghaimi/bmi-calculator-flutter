import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constant.dart';
import 'reusableCard.dart';
import 'BottomButton.dart';
class ResulePage extends StatelessWidget {
  ResulePage(this.iner,this.BMIResult,this.ResultTxt);
  final BMIResult ;
  final ResultTxt;
  final iner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style: KTytelTextstyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:reusableCard(
                activeBlueBlack,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      BMIResult,
                      style: KresultTesxtStyle,
                    ),
                    Text(
                      iner,
                        style: KBMITextStyle,
                    ),
                    Text(
                      ResultTxt,
                      style: KBodytextstyle,
                      textAlign: TextAlign.center,
                    )


                  ],
                ),
            ),
          ),
          BottomButton(
              (){
                Navigator.pop(context);
              },
              'RE-CALCULATE'
          ),
        ],
      ),
    );
  }
}
