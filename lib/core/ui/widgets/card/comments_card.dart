import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/ui/widgets/avatar/avatar.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/model/comment_model.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsCard extends StatelessWidget {
  final String idComment;
  final int favorite;
  final String comment;
  final String authorAvatar;
  final String authorName;
  final double? star;
  final String idPost;
  final String createdAt;
  final VoidCallback toggleActive;
  final bool active;
  final CommentModel commentModel;
  // final String imageUrl;

  const CommentsCard(
      {super.key,
      this.idComment = "",
      this.favorite = 0,
      this.comment = "",
      this.authorAvatar = AppImagesString.iUserDefault,
      this.authorName = "User Name",
      this.star = 0.0,
      this.idPost = "",
      this.createdAt = "",
      required this.toggleActive,
      required this.active,
      required this.commentModel
      // this.imageUrl = AppImagesString.iPostsDefault,
      });

  @override
  Widget build(BuildContext context) {
    double avatarWithLeft = 15.0;
    double avatarWithTop = 15.0;
    double spaceSideLeft = 55.0;

    double mimHeightCommentCard = Get.height * 0.14;

    bool hiddenStart = star == 0.0;
    print(commentModel.author.email);
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: mimHeightCommentCard),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(.09),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

//=============== headder star comment ========================
            children: [
              !hiddenStart
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: avatarWithLeft + 20),
                          width: (Get.width * 0.45) + avatarWithLeft,
                          decoration: const BoxDecoration(
                              color: AppColors.gray2,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [...Rating.RenderStar(star: star!)],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: toggleActive,
                                child: Icon(
                                  active
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: AppDimens.textSize18,
                                  color: active ? AppColors.red : null,
                                ),
                              ),
                              TextWidget(
                                text: favorite.toString(),
                                size: AppDimens.textSize12,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const Row(),
              Row(
                children: [
                  SizedBox(
                    width: spaceSideLeft,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: commentModel.author.email ?? authorName,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black.withOpacity(.7),
                              ),
                              hiddenStart
                                  ? Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: toggleActive,
                                            child: Icon(
                                              active
                                                  ? Icons.favorite_outlined
                                                  : Icons.favorite_outline,
                                              size: AppDimens.textSize16,
                                              color:
                                                  active ? AppColors.red : null,
                                            ),
                                          ),
                                          TextWidget(
                                            text: favorite.toString(),
                                            size: AppDimens.textSize12,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          // main comment
                          TextWidget(
                            text: comment,
                            size: AppDimens.textSize14,
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ==================== avatar ==========================
        Positioned(
          left: avatarWithLeft,
          top: avatarWithTop,
          child: Column(
            children: [
              const Avatar(radius: 50, authorImg: AppImagesString.iUserDefault),
              const SizedBox(
                height: 15,
              ),
              TextWidget(
                text: createdAt,
                size: AppDimens.textSize10,
                color: AppColors.primary,
              ),
              // TextWidget(text: favorite.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
