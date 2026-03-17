import 'package:cloud_firestore/cloud_firestore.dart';

class SignupAndLoginModel {
  String? id;
  String? name;
  String? email;
  SignupAndLoginModel({this.id, required this.name, required this.email});
  factory SignupAndLoginModel.fromMap(DocumentSnapshot map) {
    return SignupAndLoginModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'mail': email};
  }
}
