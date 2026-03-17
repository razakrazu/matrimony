import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback ontap;
  const CustomTextButton({
    super.key, required this.text, required this.color, required this.ontap, required FontWeight fontwidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}