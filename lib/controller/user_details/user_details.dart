
import 'dart:developer';

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
import 'package:matrimony_app/controller/user_details/image_pickup.dart';
import 'package:matrimony_app/controller/user_details/list_collection.dart';
import 'package:matrimony_app/controller/user_details/sarvice.dart';
import 'package:matrimony_app/model/user_details/user_details.dart';

class UserDetailsController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
    showAllCountries();
    loadReligions();
  
  }

  ListCollection listCollection = ListCollection();
  ImagePickUpController imagecontroller = ImagePickUpController();
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserSarvices sarviceController = UserSarvices();

  TextEditingController bio = TextEditingController();
  TextEditingController motherTongue = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController income = TextEditingController();
  RxnString selectgrnder = RxnString();


  var detailsIsLoading = false.obs;

  RxString profile = "Select your Profile".obs;
  RxString residentCountry = ''.obs;
  RxString residentState = ''.obs;
  RxString residentCity = ''.obs;

  RxString maritalStatus = 'Select your Marital Status'.obs;
  RxString age = "Select your Age".obs;
  RxString religion = ''.obs;
  RxString caste = ''.obs;
  RxString subCaste = ' '.obs;
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


  var profileList = <UserDetailsModel>[].obs;
  RxList<String> religionList = <String>[].obs;
  RxList<String> casteList = <String>[].obs;
  RxList<String> subCasteList = <String>[].obs;
  RxList<Country> countryList = <Country>[].obs;
  RxList<State> stateList = <State>[].obs;
  RxList<City> cityList = <City>[].obs;
  RxList<DateTime?> selectedDates = <DateTime?>[].obs;

  UserDetailsModel buildUserModel() {
    return UserDetailsModel(
      selectedProfile: profile.value,
      // gender: gender.toString(),
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
      photos: imagecontroller.selectedImages,
      bio: bio.text,
    );
  }

  void clearAllFields() {
    fullName.clear();
    dateBirth.clear();
    job.clear();
    income.clear();
    education.clear();
    bio.clear();
    motherTongue.clear();

    profile.value = "Select your Profile";
    // gender.value = false ;
    residentCountry.value = '';
    residentState.value = '';
    residentCity.value = '';
    maritalStatus.value = 'Select your Marital Status';
    age.value = "Select your Age";
    religion.value = 'select your religion';
    caste.value = 'select your caste';
    subCaste.value = 'select your subcaste';
    height.value = "Select your Height";
    weight.value = "Select your Weight";
    birthStar.value = "";
    dietPreference.value = "Select your Diet Preference";

    creativeHobbies.value = "Select your creative Hobbies";
    funHobbies.value = "Select your Fun Hobbies";
    fitnessHobbies.value = "Select your Fitness Hobbies ";
    otherInterests.value = "Select your Other Interest ";

    motherOccupation.value = "Select your Mother Occupction ";
    fatherOccupation.value = "Select your Father Occupction ";
    sister.value = 'Do you have sister';
    brother.value = 'Do you have brother';

    imagecontroller.selectedImages.clear();

    update();
  }

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

  void loadReligions() {
    religionList.value = listCollection.religionCasteData.keys.toList();
  }

  void selectReligion(String value) {
    religion.value = value;

    caste.value = '';
    subCaste.value = '';

    casteList.value =
        listCollection.religionCasteData[value]?.keys.toList() ?? [];
    subCasteList.clear();
  }

  void selectCaste(String value) {
    caste.value = value;

    subCaste.value = '';

    subCasteList.value =
        listCollection.religionCasteData[religion.value]?[value] ?? [];
  }

  void selectSubCaste(String value) {
    subCaste.value = value;
  }

  void fetchProfiles() async {
 try {
  detailsIsLoading.value = true;
  var data = await sarviceController.getAllProfiles();
  profileList.assignAll(data);
  log('${profileList.length}');
} catch (e) {
  print(e);
} finally {
  detailsIsLoading.value = false;
}
  }
}
