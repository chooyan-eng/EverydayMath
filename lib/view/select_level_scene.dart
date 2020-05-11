import 'package:flutter/material.dart';
import 'package:math_everyday/helper/user_db_helper.dart';
import 'package:math_everyday/view/select_level_page.dart';

class SelectLevelScene extends StatelessWidget {
  final User user;

  const SelectLevelScene({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: user.file == null ? 
                Icon(user.icon, size: 32, color: user.color) :
                ClipOval(
                  child: Container(
                    width: 32,
                    height: 32,
                    child: Image.file(user.file),
                  ),
                ),
            ),
          ),
        ],
      ),
      body: SelectLevelPage(),
    );
  }
}
