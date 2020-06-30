import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'IconCard.dart';
import 'Constant.dart';
import 'Result.dart';
import 'BottomButton.dart';
import 'CalculaterBrain.dart';

Gender genderSelect;
enum Gender{
    male,
    Female
  }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var malecolor=inactiveBlueBlack;
  var FemaleColor=inactiveBlueBlack;
  int height =180;
  int weight =100;
  int Age =20;


// 1 =male , 2 Female
  void UpdateColor(Gender Selectedgender){

    if(Selectedgender ==Gender.male){
      if(malecolor == inactiveBlueBlack){
          malecolor = activeBlueBlack;
          FemaleColor = inactiveBlueBlack;
      }else{
        malecolor = inactiveBlueBlack;
      }

    }else{
      if(FemaleColor == inactiveBlueBlack){
        FemaleColor = activeBlueBlack;
        malecolor = inactiveBlueBlack;
      }else{
        FemaleColor = inactiveBlueBlack;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children:<Widget>[
                Expanded(
                  flex: 1,
                  child: reusableCard(
                      ((genderSelect==Gender.male)?activeBlueBlack: inactiveBlueBlack),
                      IconCard(FontAwesomeIcons.mars,"male"),
                      (){setState(() {
                        genderSelect = Gender.male;
                      });}
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                    reusableCard(
                      ((genderSelect==Gender.Female)?activeBlueBlack: inactiveBlueBlack),
                      IconCard(FontAwesomeIcons.venus,"Female"),
                            (){setState(() {
                          genderSelect = Gender.Female;
                        });}
                      ),
                  ),

              ]

            ),
          ),
          Expanded(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  Expanded(
                    flex: 1,
                    child: reusableCard(
                        inactiveBlueBlack,Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text(
                              "HEIGHT",
                              style: KlabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: KlabelNumStyle,
                                ),
                                Text(
                                  "cm",
                                  style:KlabelTextStyle
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor:  Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x15EB1555),
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue){
                                  setState(() {
                                    height=newValue.toInt();
                                  });
                                  },


                              ),
                            ),
                          ],
                        )
                    ),
                  ),

                ]

            ),
          ),
          Expanded(
            child: Row(
              children:<Widget>[
                Expanded(
                  flex: 1,
                  child: reusableCard(
                    inactiveBlueBlack,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KlabelNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus,
                                (){
                                  setState(() {
                                    weight--;
                                  });
                                }
                                ),
                            SizedBox(width: 10,),
                            RoundIconButton(FontAwesomeIcons.plus, (){setState(() {weight++;});}),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                  children: <Widget>[
                    Expanded(
                      child: reusableCard(inactiveBlueBlack,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Text(
                                 "Age",
                                 style: KlabelTextStyle,
                                ),
                               ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  Age.toString(),
                                  style: KlabelNumStyle,
                                ),
                              ],
                           ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, (){setState(() {Age--;});}),
                                SizedBox(width: 5,),
                                RoundIconButton(FontAwesomeIcons.plus, (){setState(() {Age++;});}),

                              ],
                            ),
                         ],
                        ),



                      ),
                    ),
                  ],
                ),

                )]
          ),
          ),
          BottomButton((){
            CalclaterBrain calc = CalclaterBrain(height,weight);
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ResulePage(
                  calc.CalculateBMI(),
                  calc.GetResult(),
                  calc.getInterrepuat()
              )),
            );
          },"calculate"),
        ],
      ),
      );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton(this.icon,this.onPress);
  final  icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E),
      onPressed: onPress,


    );

  }
}





