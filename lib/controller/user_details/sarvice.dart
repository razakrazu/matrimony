import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/model/user_details/user_details.dart';

class UserSarvices {
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var users = <UserDetailsModel>[].obs;
  Future<bool> addUserDerails(UserDetailsModel userModel) async {
   
    try {
      String uid = auth.currentUser!.uid;

      await dataBase
          .collection('User')
          .doc(uid)
          .collection('profile')
          .add(userModel.toMap());
      print('Successfull');
      return true;
    } catch (e) {
      print('Error,$e');
      return false;
    }
  }

  //   Future<void> getAllUser() async {
  //     try{
  // String uid  = auth.currentUser!.uid;

  // QuerySnapshot  snapshot = await dataBase
  //           .collection('User')
  //           .doc(uid)
  //           .collection('profile')
  //           .get();

  //         log('${snapshot.docs}');
  //         users.clear();
  //         for(var doc in snapshot.docs){
  //            UserDetailsModel user = UserDetailsModel.fromMap(doc);
  //            users.add(user);
  //         }

  //     }catch(e){
  // print('error$e ');
  //     }
  //   }

  Future<List<UserDetailsModel>> getAllProfiles() async {
    List<UserDetailsModel> profileList = [];

    try {
      String uid = auth.currentUser!.uid;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('User')
          .doc(uid)
          .collection('profile')
          .get();

      for (var doc in snapshot.docs) {
        // log('${doc.data()}');
        profileList.add(
          UserDetailsModel.fromMap(doc.data() as Map<String, dynamic>),
        );
      }
    } catch (e) {
      print("Error fetching profiles: $e");
    }

    return profileList;
  }
}
