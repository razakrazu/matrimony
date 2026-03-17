import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:matrimony_app/view/login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(LoginScreen());
      }),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "lib/assets/pexels-alexander-mass-748453803-31243112.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Container(color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2)),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 390),
              child: Column(
              
                children: [
                  // Icon(Icons.favorite, color: const Color.fromARGB(255, 176, 1, 1), size: 80),
              
                  SizedBox(height: 20),
              
                  Text(
                    "Matrimony",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
              
                  SizedBox(height: 10),
              
                  Text(
                    "Find Your Perfect Life Partner",
                    style: TextStyle(color: const Color.fromARGB(179, 19, 19, 19), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
