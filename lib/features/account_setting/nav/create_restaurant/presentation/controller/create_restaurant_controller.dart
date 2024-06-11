import 'dart:io';

import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/finish_create_restaurant.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/images_identify_page.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/license_identify_page.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRestaurantController extends GetxController {
  Route? onGenerateRoute(Route setting) {
    return null;
  }

  List<Widget> getPages() {
    return [
      const LicenseIdentifyPage(),
      const ImagesIdentifyPage(),
      const FinishCreateRestaurantPage(),
    ];
  }

  final GetuserUseCase _getuserUseCase;
  CreateRestaurantController(this._getuserUseCase);

  var selectedImages = <File>[].obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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

  // ignore: non_constant_identifier_names
  bool check_list_empty() {
    return selectedImages.isEmpty;
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

// pick single image
  var backgroundImage = Rxn<File>();

  var logoImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  File? fileUploadBackground;
  File? fileUploadLogo;

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      update(["clearData"]);
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  void removeSingleImage(File? file) {
    file = null;
    update(["clearData"]);  
  }

  bool isImageEmpty(bool isLogo) {
    return isLogo ? logoImage.value == null : backgroundImage.value == null;
  }
}
