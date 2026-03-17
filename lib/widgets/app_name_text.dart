import 'package:flutter/material.dart';

class AppNameTextWidget extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String nameText;

  const AppNameTextWidget({
    super.key, required this.color, required this.fontSize, required this.nameText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      nameText,
      // "MatchAura",
      style: TextStyle(
        fontSize: fontSize,  
        // 28
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
