import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/appbar_posts_detail.dart';
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
    return const Scaffold(
        appBar: AppbaPostsDetails(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              runSpacing: AppDimens.columnSpacing,
              children: [
                TopPostsDetail(), 
                CommentBoxWidget()
              ],
            ),
          ),
        ));
  }
}
