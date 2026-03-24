import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/payiment/payiment_controller.dart';

import 'package:matrimony_app/model/user_details/user_details.dart';
import 'package:matrimony_app/view/home/payiment_screen.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key, required this.userData});
 final  PaymentController controller1 = Get.put(PaymentController());
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

                Positioned(
                  top: 40,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),

                Positioned(
                  top: 40,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.fullName ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    // "175cm / 5ft 8in • Hindu • Chartered Accountant",
                    "religion:${userData.religion ?? ""},Job: ${userData.job ?? ""},Height:${userData.height ?? ""},${userData.weight ?? ""},${userData.height ?? ""},",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            _sectionTitle("About you"),
            _card(
              child: Text(
                "Calm, ambitious and family oriented. Enjoys travelling, music and meaningful conversations.",
              ),
            ),

            _sectionTitle("Contact Details"),
            _card(
              child: Column(
                children: [
                  _tile(Icons.phone, "Mobile", "+91 9999999999"),
                  _tile(Icons.email, "Email", "demo@gmail.com"),
                ],
              ),
            ),

            _sectionTitle("Basic Details"),
            _card(
              child: Column(
                children: [
                  _tile(Icons.cake, "Date of Birth", "01/01/1998"),
                  _tile(Icons.person, "Gender", "Male"),
                  _tile(Icons.favorite, "Marital Status", "Never Married"),
                  _tile(Icons.location_on, "Location", "Kerala, India"),
                  _tile(Icons.menu_book, "Religion", "Hindu"),
                  _tile(Icons.height, "Height", "175 cm"),
                  _tile(Icons.work, "Job", "Accountant"),
                  _tile(Icons.school, "Education", "CA"),
                ],
              ),
            ),

            _sectionTitle("Hobbies & Interests"),
            _card(
              child: Column(
                children: [
                  _tile(Icons.brush, "Creative", "Drawing"),
                  _tile(Icons.sports_soccer, "Fitness", "Gym"),
                  _tile(Icons.movie, "Fun", "Movies"),
                ],
              ),
            ),

            _sectionTitle("Family Details"),
            _card(
              child: Column(
                children: [
                  _tile(Icons.person, "Father", "Business"),
                  _tile(Icons.person, "Mother", "Housewife"),
                  _tile(Icons.group, "Sisters", "1"),
                  _tile(Icons.group, "Brothers", "1"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E2D),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {

                  // Get.to(PaymentScreen());
controller1.openCheckout();

                },
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B1E2D),
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      child: child,
    );
  }

  Widget _tile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Color(0xFF8B1E2D)),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
