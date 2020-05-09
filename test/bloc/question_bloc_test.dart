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

    test('未入力の状態で5, 9, 2の順番に入力すると、inputNumが59になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      bloc.input(9);
      bloc.input(2);
      expect(bloc.inputNum, 59);
    });
  });

  group('×ボタンのテスト', () {

    test('32が入力されている状態で1文字削除すると、inputNumが3になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(3);
      bloc.input(2);
      bloc.delete();
      expect(bloc.inputNum, 3);
    });

    test('5が入力されている状態で1文字削除すると、inputNumがnullになること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(5);
      bloc.delete();
      expect(bloc.inputNum, null);
    });

    test('未入力の状態で1文字削除すると、inputNumがnullになること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.delete();
      expect(bloc.inputNum, null);
    });
  });

  group('間違いフラグのテスト', () {

    test('間違いフラグが true の状態で任意の値を入力したら間違いフラグが false になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.isError = true;
      bloc.input(1);
      expect(bloc.isError, false);
    });

    test('間違いフラグが true 、入力済みの値が2桁の状態で任意の値を入力しても間違いフラグが変わらないこと', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(2);
      bloc.input(3);
      bloc.isError = true;
      bloc.input(4);
      expect(bloc.isError, true); // 入力欄が2桁までのため、これ以上入力しても何も起こらない。
    });

    test('間違いフラグが true の状態で任意の値を削除したら間違いフラグが false になること', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.input(1);
      bloc.input(1);
      bloc.isError = true;
      bloc.delete();
      expect(bloc.isError, false);
    });

    test('間違いフラグが true 、入力済みの値が無い状態で任意の値を入力しても間違いフラグが変わらないこと', () {
      bloc.question = Question(2, 3, Operator.add);
      bloc.isError = true;
      bloc.delete();
      expect(bloc.isError, true); // 入力欄に変更がない場合は何も起こらない。
    });
  });
}