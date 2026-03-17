import 'package:flutter/material.dart';
import 'package:matrimony_app/core/colors.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: maroon,
      body: Center(
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xffE8E8E8),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xff8B1E2D),
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.celebration,
              size: 50,
              color: Colors.orange,
            ),

            SizedBox(height: 15),

            Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "You have completed all registration steps. Let’s find your perfect match.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    ),);  }
}