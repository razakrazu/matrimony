import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/login/widgets/custam_textfeild.dart';
import 'package:matrimony_app/view/login/widgets/auth_custom_button.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
 final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Title
            const Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Enter your email address and we will send you a link to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            height40,

            CustomTextField(
              icon: Icons.email_outlined,
              text: "Enter your email",
              controller: controller.passwordresetmail,
             validatortext: 'please enter email',
            ),
            height30,

            AuthCustomButton(
              ontap: () {
                controller.resetPassword();
              },
              text: 'Send Reset Link',
              colors: maroon,
              isLoading: controller.loading.value,
            ),

            height20,

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
