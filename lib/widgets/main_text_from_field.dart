import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:matrimony_app/core/colors.dart';

class MainCustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Callback? ontap;

  const  MainCustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
   required this.controller,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      controller: controller,
      onTap: ontap,
   
      decoration: InputDecoration(
        hintText: hintText,

        suffixIcon: suffixIcon,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: maroon,
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: maroon,
            width: 2,
          ),
        ),
      ),
    );
  }
}