import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matrimony_app/controller/user_details/image_pickup.dart';
import 'package:matrimony_app/model/user_details/user_details.dart';

class UserSarvices {
  ImagePickUpController imagecontroller = ImagePickUpController();
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

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

  Future<List<UserDetailsModel>> getAllUser() async {
    List<UserDetailsModel> users = [];

    QuerySnapshot userSnapshort = await dataBase.collection('User').get();
    for (var user in userSnapshort.docs) {
      QuerySnapshot profileSnapshot = await dataBase
          .collection('User')
          .doc(user.id)
          .collection('profile')
          .get();
      for (var profile in profileSnapshot.docs) {
        users.add(UserDetailsModel.fromMap(profile));
      }
    }
    return users;
  }
}
