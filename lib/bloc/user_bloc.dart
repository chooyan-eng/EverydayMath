import 'package:flutter/material.dart';
import 'package:math_everyday/helper/user_db_helper.dart';

class UserBloc extends ChangeNotifier {
  final userList = <User>[];

  Future<void> load() async {
    final userProvider = UserProvider();
    await userProvider.open();
    userList.clear();
    userList.addAll(await userProvider.getAll());
    notifyListeners();
  }
}