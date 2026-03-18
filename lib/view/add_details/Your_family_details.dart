import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart'
    show UserDetailsController;
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/add_image.dart';

import 'package:matrimony_app/widgets/custom_dropdown_button.dart'
    show CustomDropdownButton;
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class AddYourFamilyDeailScreen extends StatelessWidget {
  AddYourFamilyDeailScreen({super.key});

  final UserDetailsController controller = Get.put(UserDetailsController());
  final ListCollection  listcontroller = Get.put(ListCollection());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height90,
              
                  const Center(
                    child: Column(
                      children: [
                        TitleWidget(title: "Tell us about your family"),
                        SizedBox(height: 5),
                        SubTitleWidget(
                          subtitle:
                              'Add details to improve your profile strength',
                        ),
                      ],
                    ),
                  ),
              
                  height80,
              
                  DropdownTitleWidget(title: "Mother's Occupation "),
                  height10,
              
                  CustomDropdownButton(
                    selectvalue: controller.motherOccupation.value,
                    items: listcontroller.motherOccupationList,
                    hintText: "Fun",
                    onpressed: (String? p1) {
                      controller.motherOccupation.value = p1!;
                    },
                  ),
                  height20,
              
                  DropdownTitleWidget(title: "Father's Occupation"),
              
                  height10,
              
                  CustomDropdownButton(
                    selectvalue: controller.fatherOccupation.value,
                    items: listcontroller.fatherOccupationList,
                    hintText: "Others interests",
                    onpressed: (String? p1) {
                      controller.fatherOccupation.value = p1!;
                    },
                  ),
              
                  height20,
                  DropdownTitleWidget(title: 'Sister'),
              
                  height10,
              
                    CustomDropdownButton(
                    selectvalue: controller.sister.value,
                    items: listcontroller.sisterList,
                    hintText: "Others interests",
                    onpressed: (String? p1) {
                      controller.sister.value = p1!;
                    },
                  ),
                  height20,
                  DropdownTitleWidget(title: 'Brother'),
              
                  height10,
                CustomDropdownButton(
                    selectvalue: controller.brother.value,
                    items: listcontroller.brotherList,
                    hintText: "Others interests",
                    onpressed: (String? p1) {
                      controller.brother.value = p1!;
                    },
                  ),    
                  height70,
              
                  MainButtonWidget(
                    text: 'continue',
                    color: maroon,
                    onTap: () async{
                      // await controller.addUserFullDerails();
                      Get.to(AddImageScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
