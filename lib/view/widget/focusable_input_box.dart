import 'package:flutter/material.dart';

enum BoxState {
  normal,
  focused,
  correct,
  error,
}

class FocusableInputBox extends StatelessWidget {
  final bool hasFocus;
  final double size;
  final int value;
  final bool isCorrect;
  final bool isError;
  final VoidCallback onTap;

  final decorationMap = <BoxState, BoxDecoration>{
    BoxState.focused: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    BoxState.normal: BoxDecoration(
      border: Border.all(
        color: Colors.black12,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    BoxState.correct: BoxDecoration(
      color: Colors.green.shade50,
      border: Border.all(
        color: Colors.green,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    BoxState.error: BoxDecoration(
      border: Border.all(
        color: Colors.red.shade400,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  };

  FocusableInputBox({
    Key key,
    @required this.hasFocus,
    @required this.size,
    this.value,
    this.isCorrect = false,
    this.isError = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = isError ? BoxState.error : isCorrect ? BoxState.correct : hasFocus ? BoxState.focused : BoxState.normal;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: decorationMap[state],
        child: Center(
          child: Text(
            '${value ?? ""}', 
            style: TextStyle(
              fontSize: 36,
              color: isError ? Colors.red.shade200 : isCorrect ? Colors.green : null,
            ),
          ),
        ),
      ),
    );
  }
}
