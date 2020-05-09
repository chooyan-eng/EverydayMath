import 'package:flutter/material.dart';

class FocusableInputBox extends StatelessWidget {
  final bool hasFocus;
  final double size;
  final int value;
  final VoidCallback onTap;

  final decorationMap = <bool, BoxDecoration>{
    true: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    false: BoxDecoration(
      border: Border.all(
        color: Colors.black12,
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
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: decorationMap[hasFocus],
        child: Center(
          child: Text('${value ?? ""}', style: const TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}
