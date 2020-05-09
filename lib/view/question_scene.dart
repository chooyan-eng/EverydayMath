import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';
import 'package:math_everyday/view/question_page.dart';
import 'package:provider/provider.dart';

class QuestionScene extends StatelessWidget {
  final String label;
  final int maxAnswer;

  const QuestionScene({
    Key key,
    this.label = 'ふつう',
    this.maxAnswer = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: ChangeNotifierProvider(
        create: (context) => QuestionBloc()
          ..question = Question.random(maxAnswer)
          ..maxAnswer = maxAnswer,
        child: QuestionPage(),
      ),
    );
  }
}
