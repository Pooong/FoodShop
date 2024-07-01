import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_bookmark.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_favorite.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_post_data.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_restaurant.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/post_data_model.dart';
import 'package:find_food/features/model/restaurant_model.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_bookmark_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_favorite_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_list_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_locked_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  ProfileController(this._getuserUseCase);

  List<PostDataModel> listPostsOfUser = [];
  List<PostDataModel> listPostsOfUserLocked = [];
  List<PostDataModel> listBookmarkedPosts = [];
  List<PostDataModel> listFavoritePosts = [];
  UserModel? user;
  
  var isLoading = false.obs;

  RxInt currentIndex = 0.obs;

  PageController pageController = PageController(initialPage: 0);

  final picker = ImagePicker();

  File? imgAvatar;

  File? imgBackground;

  var restaurant = Rx<RestaurantModel>(RestaurantModel()) ?? null.obs;

  @override
  void onInit() async {
    super.onInit();

    await _init();
  }

  Future<void> _init() async {
    isLoading.value = true;
    user = await _getuserUseCase.getUser();
    if (user != null) {
      await getUser();
      await getPostsOfUser();
      await getPostsOfUserPrivate();
      await getFavoritePosts();
      await getBookmarkedPosts();
      await getRestaurant();
      await loadData();
    }
    isLoading.value = false;
  }

  Future<void> getRestaurant() async {
    final result = await FirestoreRestaurant.getRestaurant(user!.uid);
    if (result.status == Status.success) {
      restaurant.value = result.data;
      print(restaurant.value);
    }
  }

  Future<void> loadData() async {
    await Future.wait([getUser(), getPostsOfUser()]);
    update([
      "fetchDataProfilePage",
      "listPostsOfUser",
      "fetchUser",
      "fetchPostsOfUser"
    ]);
  }

  refreshProfilepage() async {
    await _init();
  }

  void onChangeNavList(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onChangePage(int index) {
    currentIndex.value = index;
  }

  /// Get the list of profile pages
  List<Widget> getPages() {
    return [
      const ProfileListPage(),
      const ProfileFavoritePage(),
      ProfileBookmarkPage(),
      const ProfileLockedPage()
    ];
  }

  /// Select an image for the avatar from the gallery
  Future<void> selectImageAvatar() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      imgAvatar = File(pickedFile.path);
      user?.avatarUrl = pickedFile.path;
      isLoading.value = true;
      update(['fetchDataProfilePage']);
      await updateUserAvatar();
      isLoading.value = false;
      update(['updateAvatar', 'fetchDataProfilePage']);
    }
  }

  /// Select an image for the background from the gallery
  Future<void> selectImageBackground() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      imgBackground = File(pickedFile.path);
      user?.backgroundUrl = pickedFile.path;
      isLoading.value = true;
      update(['fetchDataProfilePage']);
      await updateUserBackground();
      isLoading.value = false;
      update(['updateBackground', 'fetchDataProfilePage']);
    }
  }

  // Get the list of posts by the user
  Future<void> getPostsOfUser() async {
    if (user == null) return;
    final result = await FirestorePostData.getListPostOfUserPublic(user!.uid);
    if (result.status == Status.success) {
      listPostsOfUser = result.data!;
      update(["fetchPostsOfUser"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  Future<void> getPostsOfUserPrivate() async {
    if (user == null) return;
    final result = await FirestorePostData.getListPostOfUserPrivite(user!.uid);
    if (result.status == Status.success) {
      listPostsOfUserLocked = result.data!;
      update(["fetchPostsOfUser"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  // Get the list of bookmark posts by the user
  Future<void> getBookmarkedPosts() async {
    if (user == null) return;
    final result = await FirestoreBookmark.getBoolmarkPostOfUser(user!.uid);
    if (result.status == Status.success) {
      listBookmarkedPosts = result.data!;
      update(["fetchBookmarkedPosts"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  // Get the list of favorite posts by the user
  Future<void> getFavoritePosts() async {
    if (user == null) return;
    var result = await FirestoreFavorite.getFavoritedPostOfUser(user!.uid);
    if (result.status == Status.success) {
      listFavoritePosts = result.data ?? [];
      update(["fetchFavoritePosts"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  //Get the user data from Firestore
  Future<void> getUser() async {
    final result = await FirestoreUser.getUser(user!.uid);
    if (result.status == Status.success) {
      user = result.data!;
      update(["fetchUser"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  //Update the user's avatar in Firestore
  Future<void> updateUserAvatar() async {
    if (imgAvatar == null || user == null) return;

    final result = await FirebaseStorageData.uploadImage(
      imageFile: imgAvatar!,
      userId: user!.uid,
      collection: "avatarUsers",
    );
    if (result.status == Status.success) {
      user!.avatarUrl = result.data;
      await updateUserInFirestore();
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  // Update the user's background in Firestore
  Future<void> updateUserBackground() async {
    if (imgBackground == null || user == null) return;

    final result = await FirebaseStorageData.uploadImage(
      imageFile: imgBackground!,
      userId: user!.uid,
      collection: "backgroundUsers",
    );
    if (result.status == Status.success) {
      user!.backgroundUrl = result.data;
      await updateUserInFirestore();
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  // Update the user data in Firestore
  Future<void> updateUserInFirestore() async {
    final result = await FirestoreUser.updateUser(user!);
    if (result.status == Status.success) {
      SnackbarUtil.show("Updated successfully!");
      loadData();
      update(["fetchUser"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }
}
