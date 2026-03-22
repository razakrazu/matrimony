import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/hobbies_intrest.dart';
import 'package:matrimony_app/widgets/custom_dropdown_button.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/main_text_from_field.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class BasicInformationScreen extends StatelessWidget {
  BasicInformationScreen({super.key});
  final UserDetailsController controller = Get.put(UserDetailsController());
  final ListCollection listcontroller = Get.put(ListCollection());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  height90,

                  const Center(
                    child: Column(
                      children: [
                        TitleWidget(title: 'Lets get to know you'),
                        SizedBox(height: 5),
                        SubTitleWidget(
                          subtitle:
                              'Share your basic information to Get Started',
                        ),
                      ],
                    ),
                  ),

                  height80,

                  DropdownTitleWidget(title: 'Full name'),
                  height10,

                  MainCustomTextFormField(
                    hintText: 'Full name',
                    controller: controller.fullName,
                  ),
                  height25,

                  DropdownTitleWidget(title: 'Date of birth'),

                  height10,

                  MainCustomTextFormField(
                    controller: controller.dateBirth,
                    hintText: controller.selectedDates.isEmpty
                        ? "Select Date of Birth"
                        : DateFormat(
                            'dd-MM-yyyy',
                          ).format(controller.selectedDates.first!),
                    //  controller.selectedDates.first.toString().split(" ")[0],
                    ontap: () {
                      controller.pickUpDates();
                    },
                  ),

                  height10,
                  DropdownTitleWidget(title: 'Age'),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.age.value,
                    items: listcontroller.ageList,
                    hintText: "Select your profile",
                    onpressed: (String? p1) {
                      controller.age.value = p1!;
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Marital status'),

                  height10,

                  Obx(
                    () => CustomDropdownButton(
                      selectvalue: controller.religion.value,
                      items: controller.religionList,
                      hintText: "Select Religion",
                      onpressed: (String? value) {
                        controller.selectReligion(value!);
                      },
                    ),
                  ),

                  height10,
                  DropdownTitleWidget(title: 'Caste'),
                  height10,
                  CustomDropdownButton(
                    selectvalue: controller.caste.value,
                    items: controller.casteList,
                    hintText: "Select Caste",
                    onpressed: (String? value) {
                      controller.selectCaste(value!);
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Sub caste '),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.subCaste.value,
                    items: controller.subCasteList,
                    hintText: "Select your Sub caste",
                    onpressed: (String? p1) {
                      controller.subCaste.value = p1!;
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Height'),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.height.value,
                    items: listcontroller.heightList,
                    hintText: "Select your height",
                    onpressed: (String? p1) {
                      controller.height.value = p1!;
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Weight'),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.weight.value,
                    items: listcontroller.weightList,
                    hintText: "Select your weight",
                    onpressed: (String? p1) {
                      controller.weight.value = p1!;
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Birth star'),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.birthStar.value,
                    items: listcontroller.birthStarList,
                    hintText: "Select your profile",
                    onpressed: (String? p1) {
                      controller.birthStar.value = p1!;
                    },
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Education '),

                  height10,

                  MainCustomTextFormField(
                    hintText: 'Enter your Education  ',
                    controller: controller.education,
                  ),
                  height10,
                  DropdownTitleWidget(title: 'Job'),

                  height10,

                  MainCustomTextFormField(
                    hintText: 'Enter your Job  ',
                    controller: controller.job,
                  ),

                  height10,
                  DropdownTitleWidget(title: 'Income '),

                  height10,

                  MainCustomTextFormField(
                    hintText: 'enter your Income  ',
                    controller: controller.income,
                  ),

                  height10,
                  DropdownTitleWidget(title: 'Diet Preference'),

                  height10,

                  CustomDropdownButton(
                    selectvalue: controller.dietPreference.value,
                    items: listcontroller.dietPreferenceList,
                    hintText: "Select your profile",
                    onpressed: (String? p1) {
                      controller.dietPreference.value = p1!;
                    },
                  ),

                  height70,

                  MainButtonWidget(
                    text: 'continue',
                    color: maroon,
                    onTap: () {
                      Get.to(HobbiesAndIndrestScreen());
                    },
                  ),

                  height70,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
