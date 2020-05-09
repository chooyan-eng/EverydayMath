import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/view/widget/focusable_input_box.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 5 - 8;
    return Consumer<QuestionBloc>(builder: (context, bloc, _) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FocusableInputBox(
              hasFocus: bloc.focusIndex == 0,
              value: bloc.inputList[0],
              size: size,
              onTap: () => bloc.focusIndex = 0,
            ),
            Container(
              width: size * 2 / 3,
              height: size,
              child: Center(
                child: Text(
                  '+',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
            FocusableInputBox(
              hasFocus: bloc.focusIndex == 1,
              value: bloc.inputList[1],
              size: size,
              onTap: () => bloc.focusIndex = 1,
            ),
            Container(
              width: size * 2 / 3,
              height: size,
              child: Center(
                child: Text(
                  '=',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
            Container(
              height: size,
              child: Center(
                child: Text(
                  '32',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
