import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

  class ImagePickUpController  extends GetxController{

    final ImagePicker picker = ImagePicker();


    RxList<File> selectedImages = <File>[].obs;

    
 Future<void> pickMultipleImages() async {
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      selectedImages.value = images.map((e) => File(e.path)).toList();
    }
  }

    
Rx<File?>selectedImage = Rx<File?>(null);
Future<void> pickImageFromGallery()async{
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image!= null ){
    selectedImage.value = File(image.path);

  }
}
Future<void>pickImageFromCamera() async{
  final XFile? image =await picker.pickImage(source: ImageSource.camera);
  if(image != null){
    selectedImage.value = File(image.path);
  }
}


  }