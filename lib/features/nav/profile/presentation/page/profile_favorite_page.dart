import 'package:find_food/core/ui/widgets/card/profile_card.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ProfileFavoritePage extends GetView<ProfileController> {
  ProfileFavoritePage({super.key});
  // ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return controller.listPostsOfUser.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            itemCount: controller.listPostsOfUser.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (_, index) {
              PostDataModel postDataModel = controller.listPostsOfUser[index];
              return ProfileCard(
                postDataModel: postDataModel,
              );
            })
        : const SizedBox.shrink();
  }
}
