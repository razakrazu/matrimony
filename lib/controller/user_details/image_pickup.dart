import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickUpController extends GetxController {
  final ImagePicker picker = ImagePicker();

  RxList<File> selectedImages = <File>[].obs;

  Future<void> pickImagesFromGallery() async {
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      selectedImages.addAll(images.map((e) => File(e.path)).toList());
    }
  }

  Future<void> pickImagesFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImages.add(File(image.path));
    }
  }

  Future<List<String>> uploadImagesToFirebase(List<File> selectedImages) async {
    List<String> downloadUrls = [];

    try {
      for (File image in selectedImages) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        Reference ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(fileName);

        UploadTask uploadTask = ref.putFile(image);

        TaskSnapshot snapshot = await uploadTask;

        String downloadUrl = await snapshot.ref.getDownloadURL();
        log("🌐 URL: $downloadUrl");
        downloadUrls.add(downloadUrl);
      }

      return downloadUrls;
    } catch (e) {
      print("Upload Error: $e");
      return [];
    }

    // Future<List<String>> uploadAllImages(List<File> images) async {
    //   List<String> imageUrls = [];

    //   for (var image in images) {
    //     String url = await uploadImage(image);
    //     imageUrls.add(url);
    //   }

    //   return imageUrls;
    // }

    // Future<List<String>> uploadAllImages(List<File> selectedImages)async{
    //   List<String> imageUrls = [];

    // for(var image in selectedImages ){
    // String url = await pickImagesFromGallery(selectedImages);
    // imageUrls.add(url);

    // }
    // return imageUrls;
    // }
  }
}
