import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/loction_screen.dart';
import 'package:matrimony_app/widgets/app_name_text.dart';
import 'package:matrimony_app/widgets/custom_dropdown_button.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/main_text_from_field.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({super.key});
  final UserDetailsController controller = Get.put(UserDetailsController());
  @override
  Widget build(BuildContext context) {
    controller.loadCountries();
    controller.loadStates(controller.residentCountry.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                height80,
                Center(
                  child: Column(
                    children: const [
                      AppNameTextWidget(
                        color: maroon,
                        fontSize: 28,
                        nameText: 'MatchAura',
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Complete your registration in a few simple steps.",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                height90,
                const Text(
                  "Who is this profile ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                height10,

                CustomDropdownButton(
                  selectvalue: controller.selectedProfile.value,
                  items: controller.profileList,
                  hintText: "Select your profile",
                  onpressed: (String? value) {
                    controller.selectedProfile.value = value!;
                  },
                ),

                height25,

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: maroon),
                        ),
                        child: const Center(
                          child: Text(
                            "Male",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    width15,

                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: maroon,
                        ),
                        child: const Center(
                          child: Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                height25,

                const Text(
                  "Mother Tongue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                height10,
                MainCustomTextFormField(
                  hintText: 'Enter  Mother Tongue',
                  controller: controller.motherTongue,
                ),
                height35,

                MainButtonWidget(
                  text: 'continue',
                  color: maroon,
                  onTap: () {
                    Get.to(UserLocationScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
