import 'package:flutter/material.dart';

extension IconDataString on IconData {
  String toDbValue() => <IconData, String>{
    Icons.ac_unit: 'ac_unit',
    Icons.accessibility_new: 'accessibility_new',
    Icons.adb: 'adb',
    Icons.airplanemode_active: 'airplanemode_active',
    Icons.airport_shuttle: 'airport_shuttle',
    Icons.beach_access: 'beach_access',
    Icons.directions_boat: 'directions_boat',
    Icons.cake: 'cake',
    Icons.child_care: 'child_care',
  }[this];
}

extension StringIconData on String {
  IconData toIconData() => <String, IconData>{
    'ac_unit': Icons.ac_unit,
    'accessibility_new': Icons.accessibility_new,
    'adb': Icons.adb,
    'airplanemode_active': Icons.airplanemode_active,
    'airport_shuttle': Icons.airport_shuttle,
    'beach_access': Icons.beach_access,
    'directions_boat': Icons.directions_boat,
    'cake': Icons.cake,
    'child_care': Icons.child_care,
  }[this]; 
} 