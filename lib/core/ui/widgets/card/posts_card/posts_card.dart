import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/configs/app_text_string.dart';
import 'package:find_food/core/extensions/helper.dart';
import 'package:find_food/core/extensions/textures.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/card/posts_card/posts_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/model/post_data_model.dart';

// ignore: must_be_immutable
class PostsCard extends GetView<PostCardController> {
  final PostDataModel postDataModel;

  PostsCard({super.key, required this.postDataModel});

  var distance = 0.0;
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final PostCardController controller = Get.put(PostCardController());
    return _BodyCard(controller: controller);
  }

  // ignore: non_constant_identifier_names
  Container _BodyCard({required PostCardController controller}) {
    return Container(
      margin: const EdgeInsets.all(AppDimens.spacing2),
      decoration: CustomCardStyle.cardBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BackgroundImage(),
          Line.primaryLine(),
          GetBuilder<PostCardController>(
              id: "featchDataCard",
              builder: (_) {
                return _MainContent(controller: controller);
              })
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _MainContent({required PostCardController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.spacing3,
        vertical: AppDimens.spacing2,
      ),
      child: FutureBuilder(
        future: controller.distanceCalculate(postsData: postDataModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            distance = snapshot.data ?? 0.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<PostCardController>(
                    id: "updateStateInteractive",
                    builder: (_) {
                      return _TitleAndFavorite(controller: controller);
                    }),
                const SizedBox(height: AppDimens.spacing1),
                _SubTitle(content: postDataModel.subtitle),
                const SizedBox(height: AppDimens.spacing4),
                _BottomInfo(
                    isRestaurant: postDataModel.restaurantId != "",
                    distance: distance),
              ],
            );
          }
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row _BottomInfo({required bool isRestaurant, required distance}) {
    return isRestaurant
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    "4",
                    style: TextStyle(
                        fontSize: AppDimens.textSize22, color: Colors.black),
                  ),
                  const SizedBox(
                    width: AppDimens.spacing1,
                  ),
                  Row(
                    children: [
                      ...Rating.RenderStar(
                          star: 4, sizeStar: AppDimens.textSize22)
                    ],
                  ),
                  const SizedBox(
                    width: AppDimens.spacing1,
                  ),
                  const TextWidget(
                    text: "(10)",
                    size: AppDimens.textSize14,
                  ),
                  const SizedBox(
                    width: AppDimens.spacing1,
                  ),
                  TextWidget(
                    text: "${distance.toStringAsFixed(2)} km",
                    size: AppDimens.textSize10,
                  ),
                ],
              ),
              TextWidget(
                text: !true ? "Closed" : "Opening",
                color: !true ? AppColors.red : AppColors.greenBold,
                size: AppDimens.textSize12,
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextWidget(
                text: "${distance.toStringAsFixed(2)} km",
                size: AppDimens.textSize10,
              ),
            ],
          );
  }

  // ignore: non_constant_identifier_names
  Text _SubTitle({required content}) {
    return Text(
      content.trim(),
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
    );
  }

  // ignore: non_constant_identifier_names
  Row _TitleAndFavorite({required PostCardController controller}) {
    isFavorited = controller.listPostUserFavorite.contains(postDataModel.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextWidget(
            text: postDataModel.title ?? AppTextString.fCardTitleDefault,
            size: AppDimens.textSize20,
            fontWeight: FontWeight.w500,
            maxLines: 2,
          ),
        ),
        GetBuilder<PostCardController>(
          id: postDataModel.id,
          builder: (_) {
            return InkWell(
              excludeFromSemantics: true,
              onTap: () async {
                if (controller.isProcessing) return;
                await controller.toggleFavoriteState(
                    posts: postDataModel, stateIcon: !isFavorited);
                isFavorited =
                    controller.listPostUserFavorite.contains(postDataModel.id);
                controller.update([postDataModel.id ?? ""]);
              },
              child: Column(
                children: [
                  Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? AppColors.red : null,
                    size: AppDimens.textSize20,
                  ),
                  FutureBuilder<int>(
                    future: controller.getCountFavorite(postDataModel.id ?? ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                            width: AppDimens.textSize10,
                            height: AppDimens.textSize14,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ));
                      } else if (snapshot.hasError) {
                        return const TextWidget(
                          text: '0',
                          size: AppDimens.textSize10,
                        );
                      } else {
                        return TextWidget(
                          text: '${snapshot.data}',
                          size: AppDimens.textSize10,
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  ClipRRect _BackgroundImage() {
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(AppDimens.radius1)),
      child: InkWell(
        onTap: () async {
          final result = await Get.toNamed(Routes.postsDetail, arguments: {
            'postsData': postDataModel,
            'distace': distance,
            'isFavorite': isFavorited
          });
          if (result != null) {
            await controller.getCountFavorite(postDataModel.id ?? "");
            isFavorited = result['isFavorite'];
            controller.update([result['postsId']]);
          }
        },
        child: postDataModel.imageList != null &&
                postDataModel.imageList!.isNotEmpty
            ? Image.network(
                postDataModel.imageList!.first,
                height: 200,
                width: Get.width,
                fit: BoxFit.cover,
              )
            : Image.asset(
                AppImagesString.iPostsDefault,
                height: 200,
                width: Get.width,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
