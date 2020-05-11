import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';
import 'package:math_everyday/view/widget/focusable_input_box.dart';
import 'package:math_everyday/view/widget/number_keyboard.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputBoxSize = MediaQuery.of(context).size.width / 5 - 8;
    final numBoxSize = inputBoxSize * 2 / 3;
    final keySize = (MediaQuery.of(context).size.width - 32 - 24) / 4;
    return Consumer<QuestionBloc>(builder: (context, bloc, _) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: numBoxSize,
                    height: inputBoxSize,
                    child: Center(
                      child: Text(
                        '${bloc.question.num1}',
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                  Container(
                    width: numBoxSize,
                    height: inputBoxSize,
                    child: Center(
                      child: Text(
                        '+',
                        style: const TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                  Container(
                    width: numBoxSize,
                    height: inputBoxSize,
                    child: Center(
                      child: Text(
                        '${bloc.question.num2}',
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                  Container(
                    width: numBoxSize,
                    height: inputBoxSize,
                    child: Center(
                      child: Text(
                        '=',
                        style: const TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                  FocusableInputBox(
                    hasFocus: true,
                    value: bloc.inputNum,
                    size: inputBoxSize,
                    isCorrect: bloc.isCorrect,
                    isError: bloc.isError,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: NumberKeyboard(
                    keySize: keySize,
                    onTap: (value) => bloc.input(value),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: bloc.delete,
                      child: Container(
                        width: keySize,
                        height: keySize,
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('×', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: bloc.isSubmittable ? () async {
                        if (bloc.inputNum == bloc.question.answer) {
                          bloc.isCorrect = true;
                          Future.delayed(Duration(milliseconds: 1000)).then((value) => 
                            bloc.question = Question.random(bloc.maxAnswer),
                          );
                        } else {
                          bloc.isError = true;
                        }
                      } : null,
                      child: Container(
                        width: keySize,
                        height: keySize * 3 + 16,
                        decoration: BoxDecoration(
                          color: bloc.isSubmittable ? Colors.blue.withAlpha(160) : Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'OK', 
                            style: TextStyle(
                              fontSize: 40,
                              color: bloc.isSubmittable ? Colors.white : Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
          ],
        ),
      );
    });
  }
}
