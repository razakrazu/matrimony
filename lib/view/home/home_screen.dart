 
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/controller/user_details/sarvice.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/view/home/user_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthController controller = Get.put(AuthController());
  final UserSarvices sarviceController = UserSarvices();
  final UserDetailsController  detailsController  = Get.put(UserDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()  {
             controller.signOut();
          
          
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body:Obx(() {

  if (detailsController.detailsIsLoading.value) {
    return Center(child: CircularProgressIndicator());
  }

  if (detailsController.profileList.isEmpty) {
    return Center(child: Text("No Profiles Found"));
  }

 


  
     return  Padding(
            padding: const EdgeInsets.all(12),
          
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: detailsController.profileList.length,
              
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  
                ),
                itemBuilder: (context, index) {
                var user = detailsController.profileList[index];
              
              
              
                         return      InkWell(
                          onTap: (){Get.to(UserDetailsScreen(),arguments: user);
                          log("${user}");
                          },
                           child: Container(
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(20),
                                            color:Color.fromARGB(255, 209, 208, 208),
                                         
                                                 // image: const DecorationImage(
                                         
                                                 //   image: AssetImage("lib/assets/photos.avif"),
                                                 //   fit: BoxFit.cover,
                                                 // ),
                                               ),
                                               child: Stack(
                                                 children: [
                                                   InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                                                   ),
                                                   Positioned(
                            bottom: 15,
                            left: 12,
                            right: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  user.fullName ?? "No Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                         
                                const SizedBox(height: 4),
                                         
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "85%",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                         
                                const SizedBox(height: 4),
                                         
                                 Text(
                                  user.job ?? "No job",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                         
                                    
                                      Text("${
                                      user.residentState ?? "No State"},${
                                       user.residentCity ?? "No city"}",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                      ),                            
                                  
                              ],
                            ),
                                                   ),
                                         
                                                   Positioned(
                            bottom: 15,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.favorite_border, size: 20),
                            ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                         );
                },
              ),
            
          );
      
        }),
    );       
}
     
    
}

