import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_post_data.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/maps/location/models/place.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UploadController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  UploadController(this._getuserUseCase);
  var selectedImages = <File>[].obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Place? placeSelected;
  UserModel? user;

  List<String> listPathUrl = [];
  
  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    super.onInit();
  }

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  savePost() async {
    if (listPathUrl.isEmpty) {
      for (var file in selectedImages) {
        String? pathUrl = await uploadFile(imageFile: file);
        if (pathUrl != null) {
          listPathUrl.add(pathUrl);
        }
      }
    }

    final post = PostDataModel(
      title: titleController.text,
      subtitle:descriptionController.text,
      favoriteCount: 10,
      imageList: listPathUrl,
      restaurantId: 'restaurant1',
      createAt:  DateFormat('dd/MM/yyyy').format(DateTime.now()),
      isBookmarked: true,
      isFavorited: true,
      latitude: 37.7749,
      longitude: -122.4194,
    );
    final result = await FirestorePostData.savedPost(
        postDataModel: post, userId: user!.uid);
    if (result.status == Status.success) {
      listPathUrl.clear();
      selectedImages.clear();
      update(['clearData']);
      SnackbarUtil.show("Add post success".tr);
    } else {
      SnackbarUtil.show("Add post error".tr);
    }
  }

  // ignore: non_constant_identifier_names
  bool check_list_empty() {
    return selectedImages.isEmpty;
  }

  Future<String?> uploadFile({required File imageFile}) async {
    String? pathUrl;
    final result = await FirebaseStorageData.uploadImage(
        imageFile: imageFile,
        userId: user!.uid,
        collection: "post_images");
    if (result.status == Status.success) {
      pathUrl = result.data ?? "";
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
    return pathUrl;
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

  void uploadPost() {
    savePost();

    // Implement your upload logic here
    // You can use titleController.text, descriptionController.text, and selectedImages
  }
  
  


  
}
