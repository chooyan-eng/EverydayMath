import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserCreateBloc extends ChangeNotifier {

  final TextEditingController nameController = TextEditingController();

  Color _color;
  File _saveFile;
  File _tempImageFile;
  bool get isCropping => _tempImageFile != null;
  IconData _tempIconData;

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

  Future<void> saveImage() async {

  }

  Future<void> save() async {

  }
}