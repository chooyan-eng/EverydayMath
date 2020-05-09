import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/question_bloc.dart';
import 'package:math_everyday/model/question.dart';
import 'package:math_everyday/view/question_page.dart';
import 'package:math_everyday/view/select_user_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: SelectUserPage(),
      ),
    );
  }
}
