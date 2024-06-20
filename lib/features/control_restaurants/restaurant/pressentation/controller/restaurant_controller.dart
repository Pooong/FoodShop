import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_restaurant.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantController extends GetxController {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  var isLoading = false.obs;
  var menu = FoodModel.menu.obs;
  var itemsToShow = 4.obs;
  var itemHide = false.obs;

  final picker = ImagePicker();
  File? imgAvatar;
  File? imgWallpapper;
  UserModel? user;

  final GetuserUseCase _getuserUseCase;
  RestaurantController(this._getuserUseCase);

  @override
  void onInit() async {
    isLoading.value = true;
    user = await _getuserUseCase.getUser();
    await getRestaurantData();
    super.onInit();
    isLoading.value = false;
  }

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

  void clearSearch() {}

  void onSearchItemTap(name) {}

  String nameRestaurant = "";
  String emailRestaurant = "";
  String phoneRestaurant = "";
  String addressRestaurant = "";
  String avatarUrl = "";
  String backgroundUrl = "";
  Future<void> getRestaurantData() async {
    final result = await FirestoreRestaurant.getRestaurant(user!.uid);
    if (result.status == Status.success) {
      final restaurant = result.data;
      nameRestaurant = restaurant!.nameRestaurant!.toString();
      emailRestaurant = restaurant.emailRestaurant!;
      phoneRestaurant = restaurant.phoneRestaurant!;
      addressRestaurant = restaurant.addressRestaurant!;
      avatarUrl = restaurant.avatarUrl!;
      backgroundUrl = restaurant.backgroundUrl!;
      update(["getInforRestaurant"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
    // print(result.data!.toJson());
  }
}
