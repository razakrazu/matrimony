import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/view/splash/splash.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();    
  await Firebase.initializeApp();
   runApp(const MyApp());
}
final AuthController  controller  = Get.put(AuthController());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
  
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  SplashScreen()
    );
  }
}

