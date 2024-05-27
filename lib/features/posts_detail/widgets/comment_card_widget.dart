import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/configs/app_text_string.dart';
import 'package:find_food/core/ui/widgets/avatar/avatar.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommentCardWidget extends StatelessWidget {
  final int id;
  final String? authorImg;
  final String? authorName;
  final int? favorite;
  final String? comment;
  final double? star;
  final VoidCallback toggleActive;
  final bool active;

  const CommentCardWidget({
    super.key,
    required this.id,
    this.authorImg = AppImagesString.iUserDefault,
    this.authorName = AppTextString.fUserDefault,
    this.favorite = 10,
    this.comment = AppTextString.fCommentDefault,
    this.star = 0.0,
    required this.toggleActive,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    double avatarWithLeft = 15.0;
    double avatarWithTop = 5.0;
    double spaceSideLeft = 55.0;

    double mimHeightCommentCard = Get.height * 0.12;

    bool hiddenStart = star == 0.0;

    String timePosts = "3h";

    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: mimHeightCommentCard),
          margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
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
                            child: InkWell(
                              onTap: toggleActive,
                              child: Icon(
                                !active
                                    ? Icons.favorite_outline
                                    : Icons.favorite_outlined,
                                size: AppDimens.textSize16,
                                color: active ? AppColors.red : null,
                              ),
                            ))
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
                                text: authorName!,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black.withOpacity(.7),
                              ),
                              hiddenStart
                                  ? Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: InkWell(
                                        onTap: toggleActive,
                                        child: Icon(
                                          !active
                                              ? Icons.favorite_outline
                                              : Icons.favorite_outlined,
                                          size: AppDimens.textSize16,
                                          color: active ? AppColors.red : null,
                                        ),
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
                            text: comment!,
                            size: AppDimens.textSize14,
                          )
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
              const Avatar(width: 50, height: 50),
              const SizedBox(
                height: 15,
              ),
              TextWidget(
                text: "$timePosts ago",
                size: AppDimens.textSize10,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ],
    );
  }
}
