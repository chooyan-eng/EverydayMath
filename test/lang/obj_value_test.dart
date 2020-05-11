import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_everyday/helper/icon_data_helper.dart';

main() {
  group('color', () {
    test('Colorを数値に変換して元に戻せること', () {
      final blueValue = Colors.blue.value;
      final blueColor = Color(blueValue);
      expect(blueColor.value, Colors.blue.value);
    });
  });

  group('icon', () {
    test('IconDataを数値に変換して元に戻せること', () {
      final iconString = Icons.ac_unit.toDbValue();
      final iconData = iconString.toIconData();
      expect(iconData, Icons.ac_unit);
    });
  });
}