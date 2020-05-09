import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';
import 'package:math_everyday/view/question_page.dart';
import 'package:provider/provider.dart';

class QuestionScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (context) => QuestionBloc()..question = Question.random(20),
        child: QuestionPage(),
      ),
    );
  }
}