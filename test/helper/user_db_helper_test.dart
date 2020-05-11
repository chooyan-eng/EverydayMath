import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_everyday/helper/user_db_helper.dart';

main() {
  group('insert のテスト', () {
    testWidgets('とりあえず insert できるかどうかテスト', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold()));
      await tester.pumpAndSettle();
      final provider = UserProvider();
      await provider.open();
      final newUser = await provider.insert(User(
        name: 'テストユーザー',
        color: Colors.blue,
        icon: Icons.ac_unit,
        file: File('test_file.png'),
      ));
      expect(newUser.name, 'テストユーザー');
    });
  });
}