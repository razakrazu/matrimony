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
import 'package:matrimony_app/model/user_details/user_details.dart';

class UserDetailsController extends GetxController {
  void oninit() {
    loadCountries();
  religionList.value = religionCasteData.keys.toList();

    super.onInit();
  }

  FirebaseFirestore dataBase = FirebaseFirestore.instance;

  TextEditingController bio = TextEditingController();
  TextEditingController motherTongue = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController income = TextEditingController();

  RxString selectedProfile = "Select your Profile".obs;
  RxString profileFor = ''.obs;
  RxString gender = ''.obs;
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

  RxString isDisabled = ''.obs;
  RxString creativeHobbies = "Select your creative Hobbies".obs;
  RxString funHobbies = "Select your Fun Hobbies".obs;
  RxString fitnessHobbies = "Select your Fitness Hobbies ".obs;
  RxString otherInterests = "Select your Other Interest ".obs;

  RxString motherOccupation = "Select your Mother Occupction ".obs;
  RxString fatherOccupation = "Select your Father Occupction ".obs;
  RxString sister = ''.obs;
  RxString brother = ''.obs;

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

  Future<void> loadCountries() async {
    countryList.value = await getAllCountries();
    update();
  }

  Future<void> loadStates(String countryCode) async {
    stateList.value = await getStatesOfCountry(countryCode);
    update();
  }

  Future<void> loadCities(String countryCode, String stateCode) async {
    cityList.value = await getStateCities(countryCode, stateCode);
    update();
  }



  void selectReligion(String value) {
    religion.value = value;

    casteList.value = religionCasteData[value]!.keys.toList();

    caste.value = '';
    subCasteList.clear();
  }
   void selectCaste(String value) {
    caste.value = value;

    subCasteList.value =
        religionCasteData[religion.value]![value]!;

    subCaste.value = '';
  }



  Future<void> addUserFullDerails() async {
    UserDetailsModel userDetails = UserDetailsModel(
      profileFor: profileFor.value,
      gender: gender.value,
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
      isDisabled: isDisabled.value,

      creativeHobbies: creativeHobbies.value,
      funHobbies: funHobbies.value,
      fitnessHobbies: fitnessHobbies.value,
      otherInterests: otherInterests.value,

      motherOccupation: motherOccupation.value,
      fatherOccupation: fatherOccupation.value,
      brothers: brother.value,
      sisters: sister.value,

      // photos: photos,
      // bio: bio.value,

      // identityProof: identityProof.value,
    );
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await dataBase.collection('User').doc(uid).set(userDetails.toMap());
  }

  // All Lists
   RxList<String> religionList = <String>[].obs;
  RxList<String> casteList = <String>[].obs;
  RxList<String> subCasteList = <String>[].obs;
  RxList<Country> countryList = <Country>[].obs;
  RxList<State> stateList = <State>[].obs;
  RxList<City> cityList = <City>[].obs;
  RxList<DateTime?> selectedDates = <DateTime?>[].obs;


  List<String> profileList = [
    "Select your Profile",
    "Myself",
    "Son",
    "Daughter",
    "Brother",
    "Sister",
  ];
  List<String> maritalStatusList = [
    "Select your Marital Status",
    "Never Married",
    "Divorced",
    "Widowed",
    "Separated",
    "Awaiting Divorce",
  ];
  List<String> ageList = [
    "Select your Age",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
  ];

  List<String> heightList = [
    "Select your Height",
    "4 ft 6 in",
    "4 ft 7 in",
    "4 ft 8 in",
    "4 ft 9 in",
    "4 ft 10 in",
    "4 ft 11 in",
    "5 ft 0 in",
    "5 ft 1 in",
    "5 ft 2 in",
    "5 ft 3 in",
    "5 ft 4 in",
    "5 ft 5 in",
    "5 ft 6 in",
    "5 ft 7 in",
    "5 ft 8 in",
    "5 ft 9 in",
    "5 ft 10 in",
    "5 ft 11 in",
    "6 ft 0 in",
    "6 ft 1 in",
    "6 ft 2 in",
    "6 ft 3 in",
    "6 ft 4 in",
  ];

  List<String> weightList = [
    "Select your Weight",
    "40 kg",
    "42 kg",
    "44 kg",
    "46 kg",
    "48 kg",
    "50 kg",
    "52 kg",
    "54 kg",
    "56 kg",
    "58 kg",
    "60 kg",
    "62 kg",
    "64 kg",
    "66 kg",
    "68 kg",
    "70 kg",
    "72 kg",
    "74 kg",
    "76 kg",
    "78 kg",
    "80 kg",
    "82 kg",
    "84 kg",
    "86 kg",
    "88 kg",
    "90 kg",
    "92 kg",
    "94 kg",
    "96 kg",
    "98 kg",
    "100 kg",
    "105 kg",
    "110 kg",
    "115 kg",
    "120 kg",
  ];
  List<String> birthStarList = [
    "Select your Birth Star",
    "Ashwini",
    "Bharani",
    "Krittika",
    "Rohini",
    "Mrigashira",
    "Ardra",
    "Punarvasu",
    "Pushya",
    "Ashlesha",
    "Magha",
    "Purva Phalguni",
    "Uttara Phalguni",
    "Hasta",
    "Chitra",
    "Swati",
    "Vishakha",
    "Anuradha",
    "Jyeshtha",
    "Mula",
    "Purva Ashadha",
    "Uttara Ashadha",
    "Shravana",
    "Dhanishta",
    "Shatabhisha",
    "Purva Bhadrapada",
    "Uttara Bhadrapada",
    "Revati",
  ];

  List<String> dietPreferenceList = [
    "Select your Diet Preference",
    "Vegetarian",
    "Non-Vegetarian",
    "Eggetarian",
    "Vegan",
    "Jain",
    "Halal",
    "Keto",
    "Paleo",
    "Pescatarian",
    "Gluten Free",
    "No Preference",
  ];

  List<String> creativeHobbiesList = [
    "Select your creative Hobbies",
    "Painting",
    "Drawing",
    "Photography",
    "Writing",
    "Poetry",
    "Craft Making",
    "Singing",
    "Dancing",
    "Music",
    "Cooking",
    "DIY Projects",
  ];
  List<String> funHobbiesList = [
    "Select your Fun Hobbies",
    "Watching Movies",
    "Listening Music",
    "Gaming",
    "Traveling",
    "Reading Books",
    "Shopping",
    "Social Media",
    "Watching Series",
    "Blogging",
    "Vlogging",
  ];

  List<String> fitnessHobbiesList = [
    "Select your Fitness Hobbies ",
    "Gym",
    "Yoga",
    "Running",
    "Walking",
    "Cycling",
    "Swimming",
    "Meditation",
    "Sports",
    "Football",
    "Cricket",
    "Workout",
  ];

  List<String> otherInterestsList = [
    "Select your Other Interest ",
    "Technology",
    "Business",
    "Startups",
    "Investing",
    "Politics",
    "Nature",
    "Animals",
    "Volunteering",
    "Teaching",
    "Learning Languages",
  ];
  List<String> fatherOccupationList = [
    "Select your Father Occupction ",
    "Business",
    "Government Job",
    "Private Job",
    "Teacher",
    "Farmer",
    "Doctor",
    "Engineer",
    "Retired",
    "Self Employed",
    "Driver",
    "Other",
  ];
  List<String> motherOccupationList = [
    "Select your Mother Occupction ",
    "Housewife",
    "Teacher",
    "Government Job",
    "Private Job",
    "Business",
    "Nurse",
    "Doctor",
    "Self Employed",
    "Retired",
    "Other",
  ];
  List<String> sisterList = [
    "Do you have sister",
    "yes one sisters",
    "yes two sisters",
    "yes three sisters",
    "yes four  sisters",
    "yes five sisters",
  ];

  List<String> brotherList = [
    "Do you have brother",
    "yes one brothers",
    "yes two brothers",
    "yes three brothers ",
    "yes four  brothers ",
    "yes five brothers",
  ];

 
  Map<String, Map<String, List<String>>> religionCasteData = {
    "Hindu": {
      "Brahmin": [
        "Iyer",
        "Iyengar",
        "Namboothiri",
        "Gaur Brahmin",
        "Saraswat Brahmin",
      ],
      "Kshatriya": ["Rajput", "Maratha", "Reddy", "Kamma"],
      "Vaishya": ["Agarwal", "Gupta", "Bania", "Mahajan"],
      "Shudra": ["Yadav", "Kurmi", "Jat", "Lingayat"],
    },

    "Muslim": {
      "General": ["Sunni", "Shia"],
      "Community": [
        "Sayyid",
        "Sheikh",
        "Pathan",
        "Mughal",
        "Ansari",
        "Qureshi",
        "Mappila",
      ],
    },

    "Christian": {
      "Denomination": [
        "Roman Catholic",
        "Latin Catholic",
        "Syro Malabar",
        "Syro Malankara",
        "Pentecostal",
        "Marthoma",
        "Jacobite",
        "Orthodox",
      ],
    },

    "Sikh": {
      "Community": ["Jat", "Khatri", "Ramgarhia", "Mazhabhi"],
    },

    "Buddhist": {
      "Tradition": ["Theravada", "Mahayana", "Vajrayana"],
    },

    "Jain": {
      "Sect": ["Digambar", "Shwetambar", "Sthanakvasi"],
    },
  };
  // void sisterList(dynamic value ){
  //   selectedProfile.value = value;
  // }
}
