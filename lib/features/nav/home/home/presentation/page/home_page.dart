import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
import 'package:find_food/core/ui/widgets/card/posts_card.dart';
import 'package:find_food/features/nav/home/home/presentation/controller/home_controller.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: GetBuilder<HomeController>(
        id: "fetchPosts",
        builder: (logic) {
          return buildListPost();
        },
      ),
    );
  }

  Widget buildListPost() {
    return controller.listPost.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listPost.length,
            itemBuilder: (_, index) {
              PostDataModel postDataModel = controller.listPost[index];
              return PostsCard(
                postDataModel: postDataModel,
              );
            })
        : const SizedBox.shrink();
  }
}
