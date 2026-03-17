import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/user_details/user_details.dart';
import 'package:matrimony_app/controller/user_details/user_details_sarvice.dart';
import 'package:matrimony_app/core/colors.dart';
import 'package:matrimony_app/core/sizes.dart';
import 'package:matrimony_app/view/add_details/congratulations_screen.dart';
import 'package:matrimony_app/widgets/dropdown_button_title.dart';
import 'package:matrimony_app/widgets/main_app_button.dart';
import 'package:matrimony_app/widgets/sub_title.dart';
import 'package:matrimony_app/widgets/title_widget.dart';

class AddImageScreen extends StatelessWidget {
  AddImageScreen({super.key});
  final UserDetailsController controller = Get.put(UserDetailsController());
  final ImagePickUpController imagesController = Get.put(ImagePickUpController());
  @override
  // final List<String> images = [
  //   "https://picsum.photos/200/300?random=1",
  //   "https://picsum.photos/200/300?random=2",
  //   "https://picsum.photos/200/300?random=3",
  //   "https://picsum.photos/200/300?random=4",
  //   "https://picsum.photos/200/300?random=5",
  // ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,

      body: SingleChildScrollView(
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

                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // horizontal scroll
                  itemCount: imagesController.selectedImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300, // container width
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // image: Image.file(file), 
                        borderRadius: BorderRadius.circular(12),
                      // child:Image.file(imagesController.selectedImage[inde];                                )
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
    );
  }
}
