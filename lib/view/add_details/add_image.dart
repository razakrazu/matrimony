
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/controller/user_details/image_pickup.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/congratulations_screen.dart';
import 'package:matrimony_app/view/login/widgets/image_picker_bottam_sheet.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class AddImageScreen extends StatelessWidget {
  AddImageScreen({super.key});
  final UserDetailsController controller = Get.put(UserDetailsController());
  final ImagePickUpController imagesController = Get.put(
    ImagePickUpController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,

      body: Obx(
    ()=> SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                height40,
                TitleWidget(title: "Upload your best recent photo"),
        
                const SizedBox(height: 5),
        
                SubTitleWidget(
                  subtitle: 'Profiles with photos get more responses',
                ),
                height30,
        
                SizedBox(
                  height: 380,
                  child: imagesController.selectedImages.isEmpty
                      ? InkWell(
                        onTap: () => PickupBottamSheet(context)
,
                        child: Container(
                            width: 300,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 207, 207),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child: Icon(Icons.add)),
                          ),
                      )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imagesController.selectedImages.length,
                          itemBuilder: (context, index) {
                            return 
                               Container(
                                width: 300,
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 207, 207),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Icon(Icons.add),
                                    Center(
                                      child: Image.file(
                                        imagesController.selectedImages[index],
                                        fit: BoxFit.cover,
                                        height: 350,
                                        width: 300,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            
                          },
                        ),
                ),
                height20,
        
                const Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownTitleWidget(title: 'Bio'),
                ),
        
                height10,
        
                TextField(
                  controller: controller.bio,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "Describe yourself in a few words to help others know you better.",
                    hintStyle: TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: maroon),
                    ),
                  ),
                ),
        
                height10,
        
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text("54/500"),
                ),
                height40,
        
                MainButtonWidget(
                  text: 'Submit',
                  color: maroon,
                  onTap: () {
                    Get.to(CongratulationScreen());
                  },
                ),
        
                height20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
