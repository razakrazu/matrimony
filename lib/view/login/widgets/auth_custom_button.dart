import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AuthCustomButton extends StatelessWidget {
  final Callback ontap;
  final String text;
  final Color colors;
  final bool isLoading;

  const AuthCustomButton({
    super.key, required this.ontap, required this.text, required this.colors, required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colors
        ),
        child:  Center(
          child:  Text(text,
            
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          )
        ),
      ),
    );
  }
}