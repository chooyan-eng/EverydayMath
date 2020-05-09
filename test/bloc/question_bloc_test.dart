import 'package:flutter_test/flutter_test.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';

main() {
  QuestionBloc bloc;

  setUp(() {
    bloc = QuestionBloc();
  });

  group('初期化のテスト', () {

    test('入力欄が2つあること', () {
      bloc.question = Question(2, 3, Operator.add);
      expect(bloc.inputList.length, 2);
    });

    test('初期状態で1つ目の枠にフォーカスが当たっていること', () {
      bloc.question = Question(2, 3, Operator.add);
      expect(bloc.focusIndex, 0);
    });
  });

  group('フォーカスのテスト', () {

    test('フォーカスが0の状態で入力するとフォーカスが1に進むこと', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      expect(bloc.focusIndex, 1);
    });

    test('フォーカスが1の状態で入力してもフォーカスがそのままであること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.focusIndex = 1;
      bloc.input(5);
      expect(bloc.focusIndex, 1);
    });
  });

  group('入力のテスト', () {

    test('未入力の状態で5を入力すると、inputListの0番目が5になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      expect(bloc.inputList[0], 5);
    });

    test('未入力の状態で5, 9を順番に入力すると、inputListの1番目が9になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      bloc.input(9);
      expect(bloc.inputList[1], 9);
    });
  });
}