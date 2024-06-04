import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/configs/app_text_string.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/avatar/avatar.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PostsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rate;
  final int customerRated;
  final double distance;
  final String description;
  final PostDataModel postDataModel;
  bool activate;

  PostsCard(
      {super.key,
      this.title = AppTextString.fCardTitleDefault,
      this.imageUrl = AppImagesString.iPostsDefault,
      this.rate = 4.5,
      this.customerRated = 20,
      this.distance = 0.0,
      this.description = AppTextString.fCardDesription,
      this.activate = false,
      required this.postDataModel});

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.all(10);
    const double starIconSize = AppDimens.textSize22;

    return Container(
      margin: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.postsDetail, arguments: postDataModel);
              },
              child: postDataModel.imageList != null &&
                      postDataModel.imageList!.isNotEmpty
                  ? Image.network(
                      postDataModel.imageList!.first,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: postDataModel.title ?? title,
                  size: AppDimens.textSize20,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(postDataModel.subtitle ?? description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          rate.toString(),
                          style: const TextStyle(
                              fontSize: starIconSize, color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        Row(children: [
                          ...Rating.RenderStar(
                              star: rate, sizeStar: starIconSize)
                        ]),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: "($customerRated)",
                          size: AppDimens.textSize14,
                        ),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: "$distance km",
                          size: AppDimens.textSize10,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: activate ? "Opening" : "Closed",
                      color: activate ? AppColors.greenBold : AppColors.red,
                      size: AppDimens.textSize12,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
