import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_bookmark_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_favorite_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_list_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_locked_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  ProfileController(this._getuserUseCase);
  List<PostDataModel> listPost = [];
  UserModel? user;

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  void onChangeNavList(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    pageController.jumpToPage(index);
    // Get.offAndToNamed(pages[index], id: 3);
  }


  void onChangePage(int index) {
    currentIndex.value = index;
  }

  
  List<Widget> getPages() {
    return [
      ProfileListPage(),
      ProfileFavoritePage(),
      ProfileBookmarkPage(),
      ProfileLockedPage()
    ];
  }
}
