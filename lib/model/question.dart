import 'dart:math';

enum Operator {
  add,
  subtract,
  multiple,
  divide,
}

class Question {
  final int num1;
  final int num2;
  final Operator oprt; // operator は予約後 

  Question(this.num1, this.num2, this.oprt);

  int get answer {
    switch(oprt) {
      case Operator.add:
        return num1 + num2;
      case Operator.subtract:
        return num1 - num2;
      case Operator.multiple:
        return num1 * num2;
      case Operator.divide:
        return num1 ~/ num2; // TODO: とりあえず
    }
    return -1;
  }

  factory Question.random() {
    Question(
      Random().nextInt(9),
      Random().nextInt(9),
      Operator.add,
    );
  }
}