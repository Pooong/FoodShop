import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
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
      // body: CustomScrollView(
      //   slivers: [for (var i = 1; i <= 10; i++) PostsCard()],
      // ),
      body: GetBuilder<HomeController>(
        id: "fetchPosts",
        builder: (logic) {
          return buildListPost();
        },
      ),
    );
  }

  Widget buildListPost() {
    print("rebuild");
    return controller.listPost.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listPost.length,
            itemBuilder: (_, index) {
              PostDataModel postDataModel = controller.listPost[index];
              // return PostsCard(
              //   postDataModel: postDataModel,
              // );
              return ItemPost(
                callback: () {
                  controller.update(['fetchPosts']);
                },
              );
            })
        : const SizedBox.shrink();
  }
}

class ItemPost extends StatefulWidget {
  const ItemPost({super.key, required this.callback});
  final VoidCallback callback;
  @override
  State<ItemPost> createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        widget.callback;
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 40.0,
        decoration: BoxDecoration(
          color: isActive ? AppColors.colorPink : AppColors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
