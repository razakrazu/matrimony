import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/view/add_details/add_details.dart';
import 'package:matrimony_app/view/home/home_screen.dart';
import 'package:matrimony_app/view/home/user_details.dart';
import 'package:matrimony_app/view/profile/profile_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  final screens = [
    HomeScreen(),
    UserRegisterScreen(),
    UserDetailsScreen(),
    profileScreen(),
    // MyHomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.index.value]),

      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: controller.index.value,

          backgroundColor: Colors.transparent,
          color: const Color(0xff8B1E2D),
          buttonBackgroundColor:  Color(0xff8B1E2D),

          height: 65.4,

          animationDuration: const Duration(milliseconds: 300),

          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.explore, color: Colors.white),
            Icon(Icons.chat, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],

          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
