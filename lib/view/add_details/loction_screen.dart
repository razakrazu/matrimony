import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/basic_information.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class UserLocationScreen extends StatelessWidget {
  UserLocationScreen({super.key});

  final UserDetailsController controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height80,

                  const Center(
                    child: Column(
                      children: [
                        TitleWidget(title: 'Tell us where you live'),
                        SizedBox(height: 5),
                        SubTitleWidget(
                          subtitle:
                              'Add your location to find matches in your area',
                        ),
                      ],
                    ),
                  ),
                  height80,

                  DropdownTitleWidget(title: 'Resident country'),
                  height10,

                  Obx(
                    () => DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: controller.residentCountry.value.isEmpty
                          ? null
                          : controller.residentCountry.value,
                      items: controller.countryList
                          .map(
                            (country) => DropdownMenuItem<String>(
                              value: country.isoCode,
                              child: Text(country.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.residentCountry.value = value!;
                        controller.showAllStates(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 51, 5, 11),
                          ),
                        ),
                      ),
                    ),
                  ),

                  height20,

                  DropdownTitleWidget(title: 'Resident State'),

                  height10,

                  Obx(
                    () => DropdownButtonFormField(
                      isExpanded: true,
                      iconSize: 0.0,
                      value: controller.residentState.value.isEmpty
                          ? null
                          : controller.residentState.value,
                      items: controller.stateList
                          .map(
                            (state) => DropdownMenuItem(
                              value: state.isoCode,
                              child: Text(state.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.residentState.value = value!;
                        controller.showAllCities(
                          controller.residentCountry.value,
                          value,
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),

                  height20,
                  DropdownTitleWidget(title: 'Resident City'),
                  height10,

                  DropdownButtonFormField(
                    iconSize: 0.0,
                    value: controller.residentCity.value.isEmpty
                        ? null
                        : controller.residentCity.value,
                    items: controller.cityList
                        .map(
                          (city) => DropdownMenuItem(
                            value: city.name,
                            child: Text(city.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.residentCity.value = value!;
                      // controller.loadCities(
                      //   controller.residentCountry.value,
                      //   value,
                      // );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  height70,

                  MainButtonWidget(
                    text: 'continue',
                    color: maroon,
                    onTap: () {
                      Get.to(BasicInformationScreen());
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
