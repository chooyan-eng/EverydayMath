import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/user_create_bloc.dart';
import 'package:math_everyday/view/user_create_page.dart';
import 'package:provider/provider.dart';

class UserCreateScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プレイヤーを追加'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => UserCreateBloc(),
        child: UserCreatePage(),
      ),
    );
  }
}