import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextEditingController controller;
  final String validatortext;

  const CustomTextField({
    super.key,
    required this.icon, required this.text, required this.controller, required this.validatortext,
  });

 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatortext;
        }
        return null;
      },
      controller:controller,
      decoration: InputDecoration(
      
        hintText: text,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 239, 239),
        border: OutlineInputBorder(
     
          borderRadius: BorderRadius.circular(15),
          
          borderSide: BorderSide.none,
        ),

      ),
          
    );
  }
}

