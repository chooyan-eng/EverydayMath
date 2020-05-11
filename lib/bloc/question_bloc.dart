import 'package:flutter/material.dart';
import 'package:math_everyday/model/question.dart';

class QuestionBloc extends ChangeNotifier {
  int maxAnswer;
  Question _question;
  int _inputNum;
  bool _isCorrect = false;
  bool _isError = false;

  bool get isSubmittable => inputNum != null;

  Question get question => _question;
  set question(Question value) {
    _isCorrect = false;
    inputNum = null;
    _question = value;

    notifyListeners();
  }

  int get inputNum => _inputNum;
  set inputNum(int value) {
    _inputNum = value;
    notifyListeners();
  }

  bool get isCorrect => _isCorrect;
  set isCorrect(bool value) {
    _isCorrect = value;
    notifyListeners();
  }

  bool get isError => _isError;
  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  void input(int value) {
    if (inputNum == null) {
      inputNum = value;
      isError = false;
      notifyListeners();
    } else if (inputNum < 10) {
      inputNum = inputNum * 10 + value;
      isError = false;
      notifyListeners();
    } 
  }

  void delete() {
    if (inputNum == null) {
      return;
    } else if (inputNum < 10) {
      inputNum = null;
      isError = false;
      notifyListeners();
    } else {
      inputNum ~/= 10;
      isError = false;
      notifyListeners();
    }
  }
}