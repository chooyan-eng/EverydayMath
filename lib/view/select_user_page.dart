import 'package:flutter/material.dart';
import 'package:math_everyday/view/select_level_page.dart';
import 'package:math_everyday/view/user_create_scene.dart';

class SelectUserPage extends StatelessWidget {

  Future<bool> _showConfirmDialog(BuildContext context, String name, Color color) async {
    return await showDialog<bool>(
      context: context, 
      builder: (context) => AlertDialog(
        content: RichText(
          text: TextSpan(
            children: <InlineSpan>[
              TextSpan(text: name, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
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
    );
  }

  void _navigateToNext(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLevelPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          SizedBox(height: 60),
          Text('だれが遊びますか？', style: TextStyle(fontSize: 18),),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _buildUserSelect('プレイヤー1', Icons.adb, Colors.blue, () async {
              if (await _showConfirmDialog(context, 'プレイヤー1', Colors.blue)) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _buildUserSelect('プレイヤー2', Icons.child_care, Colors.purple, () async {
              if (await _showConfirmDialog(context, 'プレイヤー2', Colors.purple)) {
                _navigateToNext(context);
              }
            }),
          ),
          SizedBox(height: 32),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserCreateScene())),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('プレイヤーを追加する'),
                  const SizedBox(width: 16),
                  Icon(Icons.add_circle_outline, color: Colors.black54,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserSelect(String name, IconData iconData, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                name, 
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                ),
              ),
            ),
            Icon(iconData, size: 32, color: color)
          ],
        ),
      ),
    );
  }
}