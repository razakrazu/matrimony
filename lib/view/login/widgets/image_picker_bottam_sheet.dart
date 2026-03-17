  import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:matrimony_app/controller/user_details/image_pickup.dart';
import 'package:matrimony_app/core/colors.dart';


  

final controller = Get.put(ImagePickUpController());

Future<dynamic> PickupBottamSheet(BuildContext context,) {
    return showModalBottomSheet(
  context: context,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
  ),
  builder: (context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 210,
      child: Column(
        children: [
          const Text(
            "Choose Image",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              /// Camera
              GestureDetector(
                onTap: () async {
                  // await picker.pickImage(source: ImageSource.camera);
                  // Navigator.pop(context);
                  controller.pickImagesFromCamera();
                  Get.back();
                  
                },
                child: Column(
                  children:  [
                 
                    Container(
                      decoration: BoxDecoration(
                      color: maroon,
                     borderRadius: BorderRadius.circular(15)
                      ),
                      
                      height: 80,
                      width: 80,
                       child: Icon(Icons.camera_alt, size: 30,color: white,),
                       
                    ),
                    SizedBox(height: 5),
                    Text("Camera"),
                  ],
                ),
              ),

              /// Gallery
              GestureDetector(
                onTap: () async {
                  // await picker.pickImage(source: ImageSource.gallery);
                  // Navigator.pop(context);
                  controller.pickImagesFromGallery();
                  Get.back();
                },
                child: Column(
                  children:  [
                       Container(
                      decoration: BoxDecoration(
                      color: maroon,
                     borderRadius: BorderRadius.circular(15)
                      ),
                      
                      height: 80,
                      width: 80,
                       child: Icon(Icons.image, size: 30,color: white,),
                       
                    ),
                    SizedBox(height: 5),
                    Text("Gallery"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  },
);
  }
