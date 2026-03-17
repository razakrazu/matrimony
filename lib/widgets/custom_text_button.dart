import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomTextButton extends StatelessWidget {
  final Callback ontap;
  final String text;
  final FontWeight fontwidget;
  final Color color;
  const CustomTextButton({
    super.key,
    required this.ontap,
    required this.text,
    required this.fontwidget,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: fontwidget),
      ),
    );
  }
}
