import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/loading/loading_data_page.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:find_food/features/posts_detail/widgets/comment_box_widget.dart';
import 'package:find_food/features/posts_detail/widgets/top_posts_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PostsDetailPage extends GetView<PostsDetailController> {
  const PostsDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: const TextWidget(text: "DETAIL"),
          centerTitle: true,
          actions: [
            controller.userComment?.uid == controller.authorPosts?.uid
                ? Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.settings))
                : const SizedBox()
          ],
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? const LoadingDataPage()
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      runSpacing: AppDimens.columnSpacing,
                      children: [TopPostsDetail(), CommentBoxWidget()],
                    ),
                  ),
                );
        }));
  }
}
