import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
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
  final ListCollection  listcontroller = Get.put(ListCollection());

  final UserDetailsController controller = Get.put(UserDetailsController());
  @override
  Widget build(BuildContext context) {
controller.showAllCountries();
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
                  selectvalue: controller.profile.value,
                  items: listcontroller.profileList,
                  hintText: "Select your profile",
                  onpressed: (String? value) {
                    controller.profile.value = value!;
                  },
                ),

                height25,
                
ToggleButtons(
  borderRadius: BorderRadius.circular(25),
  isSelected: [
    controller.selectgrnder.value == 0,
    controller.selectgrnder.value == 1,
  ],
  onPressed: (index) {
    controller.selectgrnder.value = '';
  },
  selectedColor: Colors.white,
  fillColor: maroon,
  color: Colors.black,
  borderColor: Colors.grey,
  selectedBorderColor: maroon,
  children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 18),
      child: Row(
        children: [
          Icon(Icons.person, size: 20),
          SizedBox(width: 5),
          Text("Male"),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Icon(Icons.person_outline, size: 20),
          SizedBox(width: 5),
          Text("Female"),
        ],
      ),
    ),
  ],
),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         height: 60,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           border: Border.all(color: maroon),
                //         ),
                //         child: Toogle
                //       ),
                //     ),
                //     width15,

                //     Expanded(
                //       child: Container(
                //         height: 60,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           color: maroon,
                //         ),
                //         child: const Center(
                //           child: Text(
                //             "Female",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

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
