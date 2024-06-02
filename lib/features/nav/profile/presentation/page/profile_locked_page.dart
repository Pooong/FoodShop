import 'package:find_food/core/ui/widgets/card/profile_card.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ProfileLockedPage extends GetView<ProfileController> {
  ProfileLockedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return ProfileCard();
        }
    );
}
}

// return controller.listPost.isNotEmpty
//         ? GridView.builder(
//             shrinkWrap: true,
//             itemCount: controller.listPost.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, childAspectRatio: 0.5),
//             itemBuilder: (_, index) {
//               PostDataModel postDataModel = controller.listPost[index];
//               return ProfileCard(
//                 postDataModel: postDataModel,
//               );
//             })
//         : const SizedBox.shrink();
//   }