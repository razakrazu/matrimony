import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/models/state.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide State;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
import 'package:matrimony_app/model/user_details/user_details.dart';

class UserDetailsController extends GetxController {
  void oninit() {
    showAllCountries();
    super.onInit();
  }

  ListCollection controller = ListCollection();

  FirebaseFirestore dataBase = FirebaseFirestore.instance;

  TextEditingController bio = TextEditingController();
  TextEditingController motherTongue = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController income = TextEditingController();

  RxString profile = "Select your Profile".obs;
  RxInt gender = 0.obs;
  RxString residentCountry = ''.obs;
  RxString residentState = ''.obs;
  RxString residentCity = ''.obs;

  RxString maritalStatus = 'Select your Marital Status'.obs;
  RxString age = "Select your Age".obs;
  RxString religion = ''.obs;
  RxString caste = ''.obs;
  RxString subCaste = ''.obs;
  RxString height = "Select your Height".obs;
  RxString weight = "Select your Weight".obs;
  RxString birthStar = "Select your Birth Star".obs;
  RxString dietPreference = "Select your Diet Preference".obs;

  RxString creativeHobbies = "Select your creative Hobbies".obs;
  RxString funHobbies = "Select your Fun Hobbies".obs;
  RxString fitnessHobbies = "Select your Fitness Hobbies ".obs;
  RxString otherInterests = "Select your Other Interest ".obs;

  RxString motherOccupation = "Select your Mother Occupction ".obs;
  RxString fatherOccupation = "Select your Father Occupction ".obs;
  RxString sister = 'Do you have sister'.obs;
  RxString brother = 'Do you have brother'.obs;
  RxList<dynamic> listphotos = [].obs;

  Future<void> pickUpDates() async {
    var results = await showCalendarDatePicker2Dialog(
      context: Get.context!,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: Size(325, 400),
      value: selectedDates,
    );

    if (results != null && results.isNotEmpty) {
      selectedDates.value = results;
    }
  }

  void setDates(List<DateTime?> dates) {
    selectedDates.value = dates;
  }

  Future<void> showAllCountries() async {
    countryList.value = await getAllCountries();
  }

  Future<void> showAllStates(String countryCode) async {
    stateList.value = await getStatesOfCountry(countryCode);
    update();
  }

  Future<void> showAllCities(String countryCode, String stateCode) async {
    cityList.value = await getStateCities(countryCode, stateCode);
    update();
  }

  // void selectReligion(String value) {
  //   religion.value = value;

  //   casteList.value = religionCasteData[value]!.keys.toList();

  //   caste.value = '';
  //   subCasteList.clear();
  // }
  //  void selectCaste(String value) {
  //   caste.value = value;

  //   subCasteList.value =
  //       religionCasteData[religion.value]![value]!;

  //   subCaste.value = '';
  // }
  void selectReligion(String value) {
    religion.value = value;

    caste.value = '';
    subCaste.value = '';

    casteList.assignAll(controller.religionCasteData[value]!.keys.toList());
    subCasteList.clear();
  }

  void selectCaste(String value) {
    caste.value = value;

    subCaste.value = '';

    subCasteList.assignAll(
      controller.religionCasteData[religion.value]![value]!,
    );
  }

  void selectSubCaste(String value) {
    subCaste.value = value;
  }

  Future<void> addUserDerails(UserDetailsModel userModel) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await dataBase
          .collection('User')
          .doc(uid)
          .collection('profile')
          .add(userModel.toMap());
      print('Successfull');
    } catch (e) {
      print('Error,$e');
    }
  }


UserDetailsModel buildUserModel() {
  return UserDetailsModel(
    selectedProfile: profile.value,
    gender: gender.toString(),
    motherTongue: motherTongue.text,
    residentCountry: residentCountry.value,
    residentState: residentState.value,
    residentCity: residentCity.value,
    fullName: fullName.text,
    dateBirth: dateBirth.text,
    age: age.value,
    maritalStatus: maritalStatus.value,
    religion: religion.value,
    caste: caste.value,
    subCaste: subCaste.value,
    height: height.value,
    weight: weight.value,
    birthStar: birthStar.value,
    job: job.text,
    income: income.text,
    education: education.text,
    dietPreference: dietPreference.value,
    creativeHobbies: creativeHobbies.value,
    funHobbies: funHobbies.value,
    fitnessHobbies: fitnessHobbies.value,
    otherInterests: otherInterests.value,
    motherOccupation: motherOccupation.value,
    fatherOccupation: fatherOccupation.value,
    sisters: sister.value,
    brothers: brother.value,
    photos: listphotos,
    bio: bio.text,
    // identityProof: identityProof.,
  );
}

  // All Lists
  RxList<String> religionList = <String>[].obs;
  RxList<String> casteList = <String>[].obs;
  RxList<String> subCasteList = <String>[].obs;
  RxList<Country> countryList = <Country>[].obs;
  RxList<State> stateList = <State>[].obs;
  RxList<City> cityList = <City>[].obs;
  RxList<DateTime?> selectedDates = <DateTime?>[].obs;

  // void sisterList(dynamic value ){
  //   selectedProfile.value = value;
  // }
}
