import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_everyday/helper/user_db_helper.dart';

class UserCreateBloc extends ChangeNotifier {

  final TextEditingController nameController = TextEditingController();

  var _color = Colors.blue;
  File _saveFile;
  File _tempImageFile;
  bool get isCropping => _tempImageFile != null;
  var _tempIconData = Icons.ac_unit;
  final errorMessages = <String>[];

  String get name => nameController.text;

  Color get color => _color;
  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  File get tempImageFile => _tempImageFile;
  set tempImageFile(File value) {
    _tempImageFile = value;
    notifyListeners();
  }

  File get saveFile => _saveFile;
  set saveFile(File value) {
    _saveFile = value;
    notifyListeners();
  }

  IconData get tempIconData => _tempIconData;
  set tempIconData(IconData value) {
    _tempIconData = value;
    notifyListeners();
  }

  Future<void> pickupImage() async {
    tempImageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<User> save() async {
    errorMessages.clear();
    if (name?.isEmpty ?? true) {
      errorMessages.add('「おなまえ」をきめてね');
      notifyListeners();
      return null;
    }

    final userProvider = UserProvider();
    await userProvider.open();
    final newUser = await userProvider.insert(
      User(
        name: name,
        color: color,
        icon: tempIconData,
        file: saveFile,
      ),
    );
    return newUser;
  }
}