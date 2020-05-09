import 'package:flutter_test/flutter_test.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';

main() {
  QuestionBloc bloc;

  setUp(() {
    bloc = QuestionBloc();
  });

  group('初期化のテスト', () {

    test('入力欄が最初はnullであること', () {
      bloc.question = Question(2, 3, Operator.add);
      expect(bloc.inputNum, null);
    });

  });

  group('入力のテスト', () {

    test('未入力の状態で5を入力すると、inputNumが5になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      expect(bloc.inputNum, 5);
    });

    test('未入力の状態で5, 9を順番に入力すると、inputNumが59になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      bloc.input(9);
      expect(bloc.inputNum, 59);
    });
  });
}