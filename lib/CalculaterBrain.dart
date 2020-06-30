import 'dart:math';
class CalclaterBrain{
  CalclaterBrain(this.height,this.weight);
  final height;
  final weight;
  double _bmi;
  String CalculateBMI(){
    double BMI= weight /pow(height/100, 2);
    _bmi =BMI;
    return BMI.toStringAsFixed(1);
  }
  String GetResult(){
    if (_bmi >=25) {
      return 'Over Weight';
    }else if(_bmi >18.5){
      return 'Normal';
    }else{
      return 'under weight';
    }
  }

  String getInterrepuat(){
    if (_bmi >=25) {
      return 'You Have a higher than normal body weight ';
    }else if(_bmi >18.5){
      return 'You Have a normal body weight ';
    }else{
      return 'You Have a lower than normal body weight ';
    }
  }




}