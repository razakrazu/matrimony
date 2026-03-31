 import 'package:flutter/widgets.dart';
import 'package:matrimony_app/core/colors.dart' as Colors;

Widget card({required Widget child}) {
    return Container(
      width: 360,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      child: child,
    );
  }