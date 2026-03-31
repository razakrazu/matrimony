import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/payiment/payiment_controller.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';

import 'package:matrimony_app/model/user_details/user_details.dart';
import 'package:matrimony_app/view/home/widgets/card_widgets.dart';
import 'package:matrimony_app/view/home/widgets/text_widget.dart';
import 'package:matrimony_app/view/home/widgets/title_widgets.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key, required this.userData});
  final PaymentController controller = Get.put(PaymentController());
  // final UserDetailsModel user  = Get.arguments;
  final UserDetailsModel userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://i.pravatar.cc/300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Positioned(
                //   top: 40,
                //   left: 10,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     child: Icon(Icons.arrow_back),
                //   ),
                // ),

                // Positioned(
                //   top: 40,
                //   right: 10,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     child: Icon(Icons.favorite),
                //   ),
                // ),
              ],
            ),

 Container(
                height: 110,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  // right: 220,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
              
                  border: Border.all(color: Color(0xFFE0E0E0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.fullName ?? '',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      // "175cm / 5ft 8in • Hindu • Chartered Accountant",
                      "Religion:${userData.religion ?? ""}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      // "175cm / 5ft 8in • Hindu • Chartered Accountant",
                      'Location: ${userData.residentState ?? ""},${userData.residentCity ?? ""}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
          

            sectionTitle("About"),
            card(
              child: Text(
                userData.bio ?? "",
              ),
            ),

            sectionTitle("Contact Details"),
            card(
              child: Column(
                children: [
                  detailText(Icons.phone, "Mobile", "+91 9999999999"),
                  detailText(Icons.email, "Email", "demo@gmail.com"),
                ],
              ),
            ),

            sectionTitle("Basic Details"),
            card(
              child: Column(
                children: [
                  detailText(Icons.cake, "Date of Birth", " ${userData.dateBirth ?? ""}"),
                  detailText(Icons.person, "Gender", "Male"),
                  detailText(Icons.favorite, "Marital Status", userData.maritalStatus ?? ""),
                  detailText(Icons.location_on, "Location",'${userData.residentCountry ?? ""},${userData.residentState ?? ""}'),
                  detailText(Icons.menu_book, "Religion", userData.dateBirth ?? ""),
                  detailText(Icons.height, "Height", userData.height ?? ""),
                  detailText(Icons.work, "Job", userData.job ?? ""),
                  detailText(Icons.school, "Education", userData.education ?? ""),
                ],
              ),
            ),

            sectionTitle("Hobbies & Interests"),
            card(
              child: Column(
                children: [
                  detailText(Icons.brush, "Creative", userData.creativeHobbies ?? ""),
                  detailText(Icons.sports_soccer, "Fitness", userData.fitnessHobbies ?? ""),
                  detailText(Icons.movie, "Fun", userData.funHobbies ?? ""),
                   detailText(Icons.movie, "Hobbies", userData.otherInterests ?? ""),
                ],
              ),
            ),

            sectionTitle("Family Details"),
            card(
              child: Column(
                children: [
                   detailText(Icons.person, "Father",  userData.fatherOccupation ?? ""),
                  detailText(Icons.person, "Mother",  userData.motherOccupation ?? ""),
                  detailText(Icons.group, "Sisters", userData.sisters ?? ""),
                  detailText(Icons.group, "Brothers",  userData.brothers ?? ""),
                ],
              ),
            ),

            height20,

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E2D),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Get.to(PaymentScreen());
                  controller.openCheckout();
                },
                child: Text("Continue", style: TextStyle(color: white)),
              ),
            ),
          ],
        ),
      ),
    );
  }



 

 
}
