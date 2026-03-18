import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsModel{

  String? id;
  
  String? selectedProfile;
  String? gender;
  String? motherTongue;

  String? residentCountry;
  String? residentState;
  String? residentCity;

  String? fullName;
  String? dateBirth;
  String? age;
  String? maritalStatus;
  String? religion;
  String? caste;
  String? subCaste;
  String? height;
  String? weight;
  String? birthStar;
  String? job;
  String? income;
  String? education;
  String? dietPreference;
  String? isDisabled; 

  String? creativeHobbies;
  String? funHobbies;
  String? fitnessHobbies;
  String? otherInterests;

  String? motherOccupation;
  String? fatherOccupation;
  String? sisters;
  String? brothers;

  List<dynamic>? photos;
  String? bio;

  String? identityProof;

  UserDetailsModel({
    this.id,
    this.selectedProfile,
    this.gender,
    this.motherTongue,
    this.residentCountry,
    this.residentState,
    this.residentCity,
    this.fullName,
    this.dateBirth,
    this.age,
    this.maritalStatus,
    this.religion,
    this.caste,
    this.subCaste,
    this.height,
    this.weight,
    this.birthStar,
    this.job,
    this.income,
    this.education,
    this.dietPreference,
    this.isDisabled,
    this.creativeHobbies,
    this.funHobbies,
    this.fitnessHobbies,
    this.otherInterests,
    this.motherOccupation,
    this.fatherOccupation,
    this.sisters,
    this.brothers,
    this.photos,
    this.bio,
    this.identityProof,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'profileFor': selectedProfile,
      'gender': gender,
      'motherTongue': motherTongue,
      'residentCountry': residentCountry,
      'residentState': residentState,
      'residentCity': residentCity,
      'fullName': fullName,
      'dateBirth': dateBirth,
      'age':age,
      'maritalStatus': maritalStatus,
      'religion': religion,
      'caste': caste,
      'subCaste': subCaste,
      'height': height,
      'weight':weight,
      'birthStar': birthStar,
      'job': job,
      'income':income,
      'education': education,
      'dietPreference': dietPreference,
      'isDisabled': isDisabled,
      'creativeHobbies': creativeHobbies,
      'funHobbies': funHobbies,
      'fitnessHobbies': fitnessHobbies,
      'otherInterests': otherInterests,
      'motherOccupation': motherOccupation,
      'fatherOccupation': fatherOccupation,
      'sisters': sisters,
      'brothers': brothers,
      'photos': photos,
      'bio': bio,
      'identityProof': identityProof,
    };
  }

factory UserDetailsModel.fromMap(DocumentSnapshot map) {
    return UserDetailsModel(
      id: map['id'],
      selectedProfile: map['profileFor'],
      gender: map['gender'],
      motherTongue: map['motherTongue'],
      residentCountry: map['residentCountry'],
      residentState: map['residentState'],
      residentCity: map['residentCity'],
      fullName: map['fullName'],
      dateBirth: map['dateBirth'],
      maritalStatus: map['maritalStatus'],
      religion: map['religion'],
      caste: map['caste'],
      subCaste: map['subCaste'],
      height: map['height'],
      weight:map['weight'],
      birthStar: map['birthStar'],
      job: map['job'],
      income: map['income'],
      education: map['education'],
      dietPreference: map['dietPreference'],
      isDisabled: map['isDisabled'],
      creativeHobbies: map['creativeHobbies'],
      funHobbies: map['funHobbies'],
      fitnessHobbies: map['fitnessHobbies'],
      otherInterests: map['otherInterests'],
      motherOccupation: map['motherOccupation'],
      fatherOccupation: map['fatherOccupation'],
      sisters: map['sisters'],
      brothers: map['brothers'],
      photos: map['photos'],
      bio: map['bio'],
      identityProof: map['identityProof'],
    );
  }
  
}
