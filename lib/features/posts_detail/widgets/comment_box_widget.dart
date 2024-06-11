import 'package:find_food/core/configs/app_colors.dart';
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
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 2)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<PostsDetailController>(
            id: "fetchComment",
            builder: (_) => SizedBox(
              height: Get.height * 0.6,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: controller.listComments.length,
                itemBuilder: (context, index) {
                  // reder list
                  CommentModel dataComments = controller.listComments[index];
                  return GestureDetector(
                    onLongPress: () {
                      controller.showDialogDeleteComment();
                    },
                    child: CommentsCard(
                      comment: dataComments.comment ?? "Comment is empty !!!",
                      toggleActive: () {
                        print(dataComments.isFavoriteComments);
                        controller.toggleFavoriteComments(dataComments);
                      },
                      active: dataComments.isFavoriteComments ?? false,
                    ),
                  );
                },
              ),
            ),
          ),

          // comment input
          Container(
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
                          borderRadius: BorderRadius.circular(5),
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
          )
        ],
      ),
    );
  }
}
