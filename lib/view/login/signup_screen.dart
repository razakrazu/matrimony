import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/bottom_navigation/bottom_navigation.dart';
import 'package:matrimony_app/view/login/login_screen.dart';
import 'package:matrimony_app/view/login/widgets/custam_textfeild.dart';
import 'package:matrimony_app/widgets/app_name_text.dart';
import 'package:matrimony_app/widgets/custom_text_button.dart';
import 'package:matrimony_app/view/login/widgets/auth_custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(BottomNavScreen());
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
            child: Obx(
              () => Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    height20,

                    AppNameTextWidget(
                      color: maroon,
                      fontSize: 34,
                      nameText: 'MatchAura',
                    ),

                    height10,

                    AppNameTextWidget(
                      color: black,
                      fontSize: 20,
                      nameText: 'Find Your Perfect Match',
                    ),
                    height10,
                    Text(
                      "Login to continue your journey",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 98, 98, 98),
                      ),
                    ),

                    height100,
                    CustomTextField(
                      icon: Icons.person_outline,
                      text: "Full Name",
                      controller: controller.name,
                      validatortext: 'please enter your name',
                    ),

                    height20,

                    CustomTextField(
                      icon: Icons.email_outlined,
                      text: "Email",
                      controller: controller.email,
                      validatortext: 'please enter your email',
                    ),

                    height20,
                    CustomTextField(
                      icon: Icons.lock_outline_rounded,
                      text: "Password",
                      controller: controller.password,
                      validatortext: 'please enter your password',
                    ),

                    height20,
                    AuthCustomButton(
                      ontap: () async {
                        if (controller.formkey.currentState!.validate()) {
                          await controller.signUp();
                        }
                        return;
                      },
                      text: 'REGISTER',
                      colors: maroon,
                      isLoading: controller.loading.value,
                    ),

                    height35,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        CustomTextButton(
                          ontap: () => Get.to(LoginScreen()),
                          text: 'LogIn',
                          fontwidget: FontWeight.bold,
                          color: maroon,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
