import 'dart:io';

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
}
