import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/login/forgot_password.dart';
import 'package:matrimony_app/view/login/signup_screen.dart';
import 'package:matrimony_app/view/login/widgets/custam_textfeild.dart';
import 'package:matrimony_app/widgets/app_name_text.dart';
import 'package:matrimony_app/widgets/custom_text_button.dart';
import 'package:matrimony_app/view/login/widgets/auth_custom_button.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 110),

            child: Obx(
              () => Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        color: Colors.grey.shade600,
                      ),
                    ),

                    height70,

                    CustomTextField(
                      icon: Icons.email_outlined,
                      text: "Email",
                      controller: controller.logmail,
                      validatortext: 'please enter your email',
                    ),

                    height20,

                    CustomTextField(
                      icon: Icons.lock_outline_rounded,
                      text: "Password",
                      controller: controller.logpassword,
                      validatortext: 'please enter your password',
                    ),
                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        ontap: () => Get.to(ForgotPasswordScreen()),
                        text: 'Forgot Password?',
                        fontwidget: FontWeight.w500,
                        color: maroon,
                      ),
                    ),

                    height20,

                    AuthCustomButton(
                      ontap: () {
                        if (controller.formkey.currentState!.validate()) {
                          controller.logIn();
                        }
                        return;
                      },
                      text: 'Log In',
                      colors: maroon,
                      isLoading: controller.loading.value,
                    ),
                    Row(
                      children: [
                        Divider(
                          color: const Color.fromARGB(
                            255,
                            14,
                            13,
                            13,
                          ), 
                          thickness: 60, 
                          indent: 20, 
                          endIndent: 30, 
                        ),
                        DropdownTitleWidget(title: 'OR'),
                        Divider(
                          color: const Color.fromARGB(
                            255,
                            198,
                            0,
                            0,
                          ), 
                          thickness: 5, 
                          indent: 50, 
                          endIndent: 20, 
                        ),
                      ],
                    ),
                    height30,
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: maroon, width: 1.5),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("lib/assets/yhjhk.png", height: 24),
                            const SizedBox(width: 12),
                            const Text(
                              "Sign Up with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        CustomTextButton(
                          ontap: () {
                            Get.to(SignUpScreen());
                          },
                          text: 'Sing Up',
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
