import 'package:flutter/material.dart';
import 'package:math_everyday/model/question.dart';

class QuestionBloc extends ChangeNotifier {
  Question _question;
  int _focusIndex;
  final inputList = <int>[];

  bool get isSubmittable => inputList.every((element) => element != null);

  Question get question => _question;
  set question(Question value) {
    _question = value;
    inputList.clear();
    inputList.addAll([null, null]); // とりあえず数字は2つ
    focusIndex = 0; // フォーカスを最初のやつにあてる

    notifyListeners();
  }

  int get focusIndex => _focusIndex;
  set focusIndex(int value) {
    _focusIndex = value;
    notifyListeners();
  }

  void input(int value) {
    inputList[_focusIndex] = value;
    if (inputList.length > focusIndex + 1) {
      focusIndex++;
    }
    notifyListeners();
  }  
}