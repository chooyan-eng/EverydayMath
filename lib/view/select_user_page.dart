import 'package:flutter/material.dart';
import 'package:math_everyday/view/question_scene.dart';

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
          // ボタン領域
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

  void _navigateToQuiz(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScene()));
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
            child: _buildUserSelect('とうや', Colors.blue, () async {
              if (await _showConfirmDialog(context, 'とうやさん', Colors.blue)) {
                _navigateToQuiz(context);
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
            child: _buildUserSelect('あおい', Colors.purple, () async {
              if (await _showConfirmDialog(context, 'あおいちゃん', Colors.purple)) {
                _navigateToQuiz(context);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildUserSelect(String name, Color color, VoidCallback onTap) {
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
            Icon(Icons.arrow_forward_ios, size: 16, color: color)
          ],
        ),
      ),
    );
  }
}