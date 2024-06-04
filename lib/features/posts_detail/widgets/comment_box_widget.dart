import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:find_food/core/ui/widgets/card/comments_card.dart';
import 'package:find_food/features/model/comment_model.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentBoxWidget extends GetWidget<PostsDetailController> {
  const CommentBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var rate = 4.0;
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
                  return CommentsCard(
                    comment: dataComments.comment ?? "comment empty !!!",
                    toggleActive: () {
                      print(dataComments.isFavoriteComments);
                      controller.toggleFavoriteComments(dataComments);
                    },
                    active: dataComments.isFavoriteComments ?? false,
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
                        child: TextField(
                          controller: controller.commentController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your comment",
                              hintStyle: TextStyle(color: AppColors.grey)),
                        )),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 15,
                      child: InkWell(
                        onTap: () => {
                          DialogsUtils.showRatingDialog(
                            initialRating: rate,
                            onRatingUpdate: (rating) {
                              rate = rating;
                            },
                            onSubmit: () {
                              print("Rating submitted");
                              // Handle submit action
                            },
                          ),
                        },
                        child: const Icon(
                          Icons.star_rounded,
                          size: AppDimens.textSize42,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ],
                )),
                InkWell(
                    onTap: () {
                      controller.uploadComment();
                    },
                    child: Image.asset('assets/images/send.png'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
