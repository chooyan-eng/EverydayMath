import 'package:flutter/material.dart';
import 'package:math_everyday/view/question_scene.dart';

class SelectLevelPage extends StatelessWidget {

  void _navigateToQuiz(BuildContext context, int maxAnswer, String label) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScene(
      maxAnswer: maxAnswer,
      label: label,
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              'レベルを選んでください',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _buildLevelSelect('むずかしい', Colors.purple, () => _navigateToQuiz(context, 99, 'むずかしい')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                height: 1,
                color: Colors.black12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _buildLevelSelect('ふつう', Colors.blue, () => _navigateToQuiz(context, 20, 'ふつう')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                height: 1,
                color: Colors.black12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _buildLevelSelect('かんたん', Colors.lightGreen, () => _navigateToQuiz(context, 10, 'かんたん')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelSelect(String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
