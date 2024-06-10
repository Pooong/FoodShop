import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_restaurant.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/finish_create_restaurant.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/images_identify_page.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/license_identify_page.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRestaurantController extends GetxController {
  Route? onGenerateRoute(Route setting) {
    return null;
  }

  List<Widget> getPages() {
    return [
      LicenseIdentifyPage(),
      ImagesIdentifyPage(),
      FinishCreateRestaurantPage(),
    ];
  }

  final GetuserUseCase _getuserUseCase;
  CreateRestaurantController(this._getuserUseCase);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  UserModel? user;

  var licenseImages = <File>[].obs;
  var ownerLicenseImages = <File>[].obs;
  var restaurantBackgroundImages = <File>[].obs;
  var restaurantLogoImages = <File>[].obs;

  final nameRestaurant = TextEditingController();
  final emailRestaurant = TextEditingController();
  final phoneRestaurant = TextEditingController();
  final addressRestaurant = TextEditingController();
  List<String> listPathUrl = [];

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    super.onInit();
  }

  void saveRestaurant() async {
    var allImages = [
      ...licenseImages,
      ...ownerLicenseImages,
      ...restaurantBackgroundImages,
      ...restaurantLogoImages,
    ];

    if (listPathUrl.isEmpty) {
      for (var file in allImages) {
        String? pathUrl = await uploadFile(imageFile: file);
        if (pathUrl != null) {
          listPathUrl.add(pathUrl);
        }
      }
    }

    final restaurant = RestaurantModel(
      idRestaurant: user!.uid,
      nameRestaurant: nameRestaurant.text,
      emailRestaurant: emailRestaurant.text,
      phoneRestaurant: phoneRestaurant.text,
      addressRestaurant: addressRestaurant.text,
      listPathUrl: listPathUrl,
    );

    final result = await FirestoreRestaurant.createRestaurant(restaurant);
    if (result.status == Status.success) {
      SnackbarUtil.show("Menu created successfully");
      Get.offAllNamed('accountSetting');
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  Future<String?> uploadFile({required File imageFile}) async {
    String? pathUrl;
    final result = await FirebaseStorageData.uploadImage(
        imageFile: imageFile, userId: user!.uid, collection: "Lisencse Image");
    if (result.status == Status.success) {
      pathUrl = result.data ?? "";
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
    return pathUrl;
  }

  Future<void> pickImages(List selectedImages) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  bool check_list_empty(List images) {
    return images.isEmpty;
  }

  void removeImage(List imageVerify, File image) {
    imageVerify.remove(image);
  }

  void removeSingleImage(bool isLogo) {
    if (isLogo) {
      logoImage.value = null;
    } else {
      backgroundImage.value = null;
    }
  }

// pick single image
  var backgroundImage = Rxn<File>();
  var logoImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  void pickImage(bool isLogo) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isLogo) {
        logoImage.value = File(pickedFile.path);
      } else {
        backgroundImage.value = File(pickedFile.path);
      }
    }
  }

  bool isImageEmpty(bool isLogo) {
    return isLogo ? logoImage.value == null : backgroundImage.value == null;
  }
}
