import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/user_bloc.dart';
import 'package:math_everyday/helper/user_db_helper.dart';
import 'package:math_everyday/view/select_level_page.dart';
import 'package:math_everyday/view/user_create_scene.dart';
import 'package:provider/provider.dart';

class SelectUserPage extends StatelessWidget {

  Future<bool> _showConfirmDialog(BuildContext context, User user) async {
    return await showDialog<bool>(
      context: context, 
      builder: (context) => AlertDialog(
        content: RichText(
          text: TextSpan(
            children: <InlineSpan>[
              TextSpan(text: user.name, style: TextStyle(color: user.color, fontWeight: FontWeight.bold)),
              TextSpan(text: ' が遊びますか？', style: TextStyle(color: Colors.black87)),
            ]
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("いいえ"),
            onPressed: () {
              Navigator.pop(context, false);
            }
          ),
          FlatButton(
            child: Text(
              "はい", 
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    ) ?? false;
  }

  void _navigateToNext(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLevelPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Text('だれが遊びますか？', style: TextStyle(fontSize: 18),),
            SizedBox(height: 60),
            Consumer<UserBloc>(
              builder: (context, userBloc, child) => Column(
                children: userBloc.userList.isEmpty ? [
                  Text('まずはあたらしいプレイヤーをつくろう', style: TextStyle(color: Colors.black45),),
                ] : (userBloc.userList.expand<Widget>((user) => [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: _buildUserSelect(user, () async {
                      if (await _showConfirmDialog(context, user)) {
                        _navigateToNext(context);
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      height: 1,
                      color: Colors.black12,
                    )
                  ),
                ]).toList()..removeLast())
              ),
            ),
            SizedBox(height: 32),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserCreateScene())),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('あたらしいプレイヤー', style: TextStyle(color: Colors.blue),),
                    const SizedBox(width: 16),
                    Icon(Icons.add_circle_outline, color: Colors.blue,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildUserSelect(User user, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                user.name, 
                style: TextStyle(
                  color: user.color,
                  fontSize: 24,
                ),
              ),
            ),
            user.file == null ? 
              Icon(user.icon, size: 32, color: user.color) :
              ClipOval(
                child: Container(
                  width: 32,
                  height: 32,
                  child: Image.file(user.file),
                ),
              ),
          ],
        ),
      ),
    );
  }
}