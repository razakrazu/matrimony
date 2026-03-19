import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/Your_family_details.dart';
import 'package:matrimony_app/widgets/custom_dropdown_button.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class HobbiesAndIndrestScreen extends StatelessWidget {
  HobbiesAndIndrestScreen({super.key});
  final UserDetailsController controller = Get.put(UserDetailsController());
  final ListCollection listcontroller = Get.put(ListCollection());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height80,

                const Center(
                  child: Column(
                    children: [
                      TitleWidget(title: "Let's add hobbies & interests"),
                      SizedBox(height: 5),
                      SubTitleWidget(
                        subtitle:
                            'your intersts help us find better compartibility',
                      ),
                    ],
                  ),
                ),

                height70,

                DropdownTitleWidget(title: 'Creative '),
                height10,

                CustomDropdownButton(
                  selectvalue: controller.creativeHobbies.value,
                  items: listcontroller.creativeHobbiesList,
                  hintText: "Fun",
                  onpressed: (String? p1) {
                    controller.creativeHobbies.value = p1!;
                  },
                ),
                height20,

                DropdownTitleWidget(title: 'Fun'),

                height10,

                CustomDropdownButton(
                  selectvalue: controller.funHobbies.value,
                  items: listcontroller.funHobbiesList,
                  hintText: "Others interests",
                  onpressed: (String? p1) {
                    controller.funHobbies.value = p1!;
                  },
                ),
                height20,

                DropdownTitleWidget(title: 'Fitness'),

                height10,

                CustomDropdownButton(
                  selectvalue: controller.fitnessHobbies.value,
                  items: listcontroller.fitnessHobbiesList,
                  hintText: "Others interests",
                  onpressed: (String? p1) {
                    controller.fitnessHobbies.value = p1!;
                  },
                ),

                height20,
                DropdownTitleWidget(title: 'Others interests'),

                height10,

                CustomDropdownButton(
                  selectvalue: controller.otherInterests.value,
                  items: listcontroller.otherInterestsList,
                  hintText: "Select your profile",
                  onpressed: (String? p1) {
                    controller.otherInterests.value = p1!;
                  },
                ),

                height70,

                MainButtonWidget(
                  text: 'continue',
                  color: maroon,
                  onTap: () {
                    Get.to(AddYourFamilyDeailScreen());
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
