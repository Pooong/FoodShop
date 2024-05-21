import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {

  var selectedImages = <File>[].obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

  void uploadPost() {
    // Implement your upload logic here
    // You can use titleController.text, descriptionController.text, and selectedImages
  }
}
