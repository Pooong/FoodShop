import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/extensions/color.dart';
import 'package:find_food/core/ui/widgets/card/comments_card.dart';
import 'package:find_food/features/model/comment_model.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentBoxWidget extends GetWidget<PostsDetailController> {
  const CommentBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.radius1),
        boxShadow: CustomShadow.cardShadow,
      ),
      child: MainContentCommentBox(controller: controller),
    );
  }
}

class MainContentCommentBox extends StatelessWidget {
  const MainContentCommentBox({
    super.key,
    required this.controller,
  });
  final PostsDetailController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<PostsDetailController>(
          id: "fetchComment",
          builder: (_) => Container(
            constraints: BoxConstraints(
              maxHeight: Get.height * 0.5,
            ),
            child: controller.listComments.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10),
                    itemCount: controller.listComments.length,
                    itemBuilder: (context, index) {
                      CommentModel dataComments =
                          controller.listComments[index];
                      return GestureDetector(
                        onLongPress: () {
                          controller.showDialogDeleteComment();
                        },
                        child: CommentsCard(
                          comment:
                              dataComments.comment ?? "Comment is empty !!!",
                          toggleActive: () {
                            print(dataComments.isFavoriteComments);
                            controller.toggleFavoriteComments(dataComments);
                          },
                          active: dataComments.isFavoriteComments ?? false,
                          commentModel: dataComments,
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: Get.height * 0.1,
                    child: const Center(
                      child: Text('No comments available'),
                    ),
                  ),
          ),
        ),
        // comment input
        CommentBar(controller: controller),
      ],
    );
  }
}

class CommentBar extends StatelessWidget {
  const CommentBar({
    super.key,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.gray2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppDimens.radius1),
                    border: Border.all(
                      color: AppColors.gray.withOpacity(.6),
                    )),
                child: SizedBox(
                  width: Get.width * .65,
                  child: TextField(
                    controller: controller.commentController,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your comment",
                        hintStyle: TextStyle(color: AppColors.grey)),
                  ),
                ),
              ),
            ],
          )),
          InkWell(
              onTap: () {
                controller.uploadComment();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Image.asset('assets/images/send.png')))
        ],
      ),
    );
  }
}
