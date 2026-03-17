import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  final String subtitle;
  const SubTitleWidget({
    super.key, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        color: Colors.black54,
      ),
    );
  }
}