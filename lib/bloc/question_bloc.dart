import 'package:flutter/material.dart';
import 'package:math_everyday/model/question.dart';

class QuestionBloc extends ChangeNotifier {
  Question _question;
  int _inputNum;

  bool get isSubmittable => inputNum != null;

  bool get isCorrect => inputNum == question.answer;

  Question get question => _question;
  set question(Question value) {
    _question = value;
    inputNum = null;

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

  void delete() {
    if (inputNum == null) {
      return;
    } else if (inputNum < 10) {
      inputNum = null;
      notifyListeners();
    } else {
      inputNum ~/= 10;
      notifyListeners();
    }
  }
}