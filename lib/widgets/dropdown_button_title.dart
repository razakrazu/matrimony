import 'package:flutter/material.dart';

class DropdownTitleWidget extends StatelessWidget {
  final String title;
  const DropdownTitleWidget({

    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
    title,
      style: TextStyle(fontWeight: FontWeight.w600),
    );
  }
}