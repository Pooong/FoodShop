import 'dart:io';

import 'package:find_food/features/restaurant/pressentation/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantController extends GetxController {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  var menu = FoodModel.menu.obs;
  var itemsToShow = 4.obs;
  var itemHide = false.obs;

  final picker = ImagePicker();
  File? imgAvatar;
  File? imgWallpapper;

  Future selectImageAvatarGallery() async {
    final pickFileImg =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickFileImg != null) {
      imgAvatar = File(pickFileImg.path);
      update(['updateAvatar']);
    }
  }

  Future selectImageWallpaper() async {
    final pickFileImg =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickFileImg != null) {
      imgWallpapper = File(pickFileImg.path);
      update(['updateWallpaper']);
    }
  }

  void updateFood(int index, FoodModel updatedFood) {
    var updatedMenu = List<FoodModel>.from(menu);
    updatedMenu[index] = updatedFood;
    menu.assignAll(updatedMenu);
    // clearControllers();
  }

  void inforCard(FoodModel food) {
    print(food.toJson());
    imageController.text = food.imageFood;
    nameController.text = food.foodName;
    priceController.text = food.priceFood;
  }

  // void clearControllers() {
  //   imageController.clear();
  //   nameController.clear();
  //   priceController.clear();
  // }

  void seeMore() {
    if (itemsToShow.value < menu.length) {
      itemsToShow.value += 4;
      itemHide.value = true;
    }
  }

  void hideItems() {
    itemsToShow.value = 4;
    itemHide.value = false;
  }
}
