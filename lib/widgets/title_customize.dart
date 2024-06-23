import 'package:flutter/material.dart';

class TitleCustomize extends StatelessWidget {
  final String data;
  final double fontSize;
  final bool isBold;
  final Color color;

  const TitleCustomize(
      {super.key,
      required this.data,
      required this.fontSize,
      required this.isBold, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
