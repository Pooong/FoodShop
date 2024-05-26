import 'package:find_food/features/nav/profile/nav/profile_favorite/presentation/controller/profile_favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileFavoritePage extends StatelessWidget {
  ProfileFavoritePage({super.key});
  ProfileFavoriteController controller = Get.put(ProfileFavoriteController());
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorite"),
    );
  }
}
