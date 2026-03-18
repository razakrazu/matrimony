import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:matrimony_app/model/signup_login/signup_login.dart';
import 'package:matrimony_app/view/bottom_navigation/bottom_navigation.dart';
import 'package:matrimony_app/view/login/login_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore dataBase = FirebaseFirestore.instance;

  TextEditingController logmail = TextEditingController();
  TextEditingController logpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordresetmail = TextEditingController();
  final loginformkey = GlobalKey<FormState>();
    final signupformkey = GlobalKey<FormState>();

  var loading = false.obs;
  var ishidden = true.obs;
  RxInt index = 0.obs;

  void onInit() async {
    super.onInit();
    await checkUser();
  }

  void changeIndex(int selectedIndex) {
    index.value = selectedIndex;
  }

  void passwordVisiblity() {
    ishidden.value = !ishidden.value;
  }

  Future<void> checkUser() async {
     auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => BottomNavScreen());
      }
    });
  }

  Future<void> signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await addUserDatas();
      await verifyEmail();
      Get.to(BottomNavScreen());

      loading.value = false;
      Get.snackbar('Success ', 'send mail confametion check your mail');
    } catch (e) {
      loading.value = false;
      Get.snackbar('Error', '$e');
    }
  }

  Future<void> addUserDatas() async {
    SignupAndLoginModel user = SignupAndLoginModel(
      name: name.text,
      email: auth.currentUser?.email,
    );

    await dataBase
        .collection('User')
        .doc(auth.currentUser?.uid)
        .collection('Profile')
        .add(user.toMap());
    name.clear();
    email.clear();
    password.clear();
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.to(LoginScreen());
  }

  Future<void> logIn() async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
        email: logmail.text,
        password: logpassword.text,
      );
      logmail.clear();
      logpassword.clear();

      Get.offAll(() => BottomNavScreen());

      loading.value = false;
    } catch (e) {
      loading.value = false;
      Get.snackbar('Error...', '${e.toString()}');
    }
  }

  Future<void> verifyEmail() async {
    try {
      await auth.currentUser!.sendEmailVerification();
      Get.snackbar('Success ', 'send mail confametion check your mail');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> resetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: passwordresetmail.text);
      Get.snackbar(
        'Email',
        'send Successfull',
        backgroundColor: const Color.fromARGB(255, 187, 239, 188),
      );
      Get.to(LoginScreen());
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }
}
