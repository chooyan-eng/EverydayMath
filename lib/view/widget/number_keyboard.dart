import 'package:flutter/material.dart';

class NumberKeyboard extends StatelessWidget {
  final double keySize;
  final ValueChanged onTap;

  const NumberKeyboard({
    Key key,
    this.keySize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: keySize * 3 + 16,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(9, (index) => index + 1)
            .map((e) => _buildKey(e, keySize))
            .toList()
            ..addAll([
              SizedBox(width: keySize, height: keySize),
              _buildKey(0, keySize),
              SizedBox(width: keySize, height: keySize),
            ]),
      ),
    );
  }

  Widget _buildKey(int value, double size) {
    return InkWell(
      onTap: () => onTap(value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('$value', style: TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}
