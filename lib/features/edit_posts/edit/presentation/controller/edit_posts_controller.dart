import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditPostsController extends GetxController {
  final PostDataModel dataPosts = Get.arguments;

  TextEditingController? titleController;
  TextEditingController? subtitleController;
  var selectedImages = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController(text: dataPosts.title);
    subtitleController = TextEditingController(text: dataPosts.subtitle);
    // Convert image paths (String) to File objects
    if (dataPosts.imageList != null) {
      selectedImages.value = dataPosts.imageList ?? [];
    }
  }

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    selectedImages.addAll(pickedImages.map((image) => image.path).toList());
  }

  // ignore: non_constant_identifier_names
  bool check_list_empty() {
    return selectedImages.isEmpty;
  }

  Future<String?> uploadFile({required File imageFile}) async {
    String? pathUrl;
    final result = await FirebaseStorageData.uploadImage(
        imageFile: imageFile,
        userId: dataPosts.userId ?? "",
        collection: "post_images");
    if (result.status == Status.success) {
      pathUrl = result.data ?? "";
    } else {
      Fluttertoast.showToast(
          msg: result.exp!.message ?? "something_went_wrong");
    }
    return pathUrl;
  }

  void removeImage(dynamic image) {
    selectedImages.remove(image);
  }
}
