import 'package:flutter/material.dart';
import 'package:math_everyday/model/question.dart';

class QuestionBloc extends ChangeNotifier {
  Question _question;
  int _focusIndex;
  int _inputNum;

  bool get isSubmittable => inputNum != null;

  Question get question => _question;
  set question(Question value) {
    _question = value;
    inputNum = null;
    focusIndex = 0; // フォーカスを最初のやつにあてる

    notifyListeners();
  }

  int get focusIndex => _focusIndex;
  set focusIndex(int value) {
    _focusIndex = value;
    notifyListeners();
  }

  int get inputNum => _inputNum;
  set inputNum(int value) {
    _inputNum = value;
    notifyListeners();
  }

  void input(int value) {
    if (inputNum == null) {
      inputNum = value;
      notifyListeners();
    } else if (inputNum < 10) {
      inputNum = inputNum * 10 + value;
      notifyListeners();
    } 
  }  
}