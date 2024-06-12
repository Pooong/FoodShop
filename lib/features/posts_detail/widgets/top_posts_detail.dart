import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/extensions/color.dart';
import 'package:find_food/core/ui/widgets/avatar/avatar.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isVisible = true;

// ignore: must_be_immutable
class TopPostsDetail extends GetView<PostsDetailController> {
  const TopPostsDetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsDetailController>(
        id: "fetchDataTopPostDetail",
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPosts(controller: controller),
              SubTitle(controller: controller),
              Wrap(
                runSpacing: AppDimens.columnSpacing,
                children: [
                  Slider(controller: controller),
                  TagInfoPosts(controller: controller),
                  if(controller.isRestaurant)
                  const TagToRestauRant(),
                ],
              )
            ],
          );
        });
  }
}


class HeaderPosts extends StatelessWidget {
  const HeaderPosts({
    super.key,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Get.width * .02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Avatar(
              authorImg: controller.authorPosts?.photoUrl ??
                  AppImagesString.iBackgroundUserDefault,
              radius: 50),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Text(
                        controller.postDataModel?.title?.trim() ??
                            'Write title posts this here  ',
                        style: const TextStyle(
                            fontSize: AppDimens.textSize16,
                            fontWeight: FontWeight.w500),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${controller.timePosts} - ${controller.authorPosts?.displayName ?? "Author posts"} ',
                      style: const TextStyle(
                        fontSize: AppDimens.textSize10,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => IconButton(
                    onPressed: controller.toggleBookmarkStatus,
                    icon: Icon(
                      controller.isBookmark.value
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isBookmark.value ? Colors.yellow : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(controller.postDataModel?.subtitle?.trim() ??
          "Writing this post's description this here ...."),
    );
  }
}

class TagToRestauRant extends StatelessWidget {
  const TagToRestauRant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.radius1),
          boxShadow: CustomShadow.cardShadow,
        ),
        child: Column(
          children: [
            isVisible
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Restaurant Name',
                        style: TextStyle(
                            fontSize: AppDimens.textSize14,
                            color: AppColors.black),
                      ),
                      // SizedBox(width: 120),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'To restaurant',
                            style: TextStyle(
                              fontSize: AppDimens.textSize14,
                              color: AppColors.red,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.red,
                          )
                        ],
                      ),
                    ],
                  )
                : Container(), // Or SizedBox.shrink() if you prefer
          ],
        ));
  }
}

class TagInfoPosts extends StatelessWidget {
  const TagInfoPosts({
    super.key,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    double reat = 4;
    int reatPerson = 20;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: CustomShadow.cardShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.isRestaurant
                      ? Row(
                          children: [
                            Text(
                              "$reat",
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  ...Rating.RenderStar(star: reat, sizeStar: 25)
                                ],
                              ),
                            ),
                            Text(
                              "($reatPerson)",
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  if(controller.isRestaurant)
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: Colors.black, size: 20.0),
                      const SizedBox(width: 5),
                      const Text(
                        "2.7km",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if(controller.isRestaurant)
                      const Text(
                        "Opening",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.comment,
                            color: Color.fromRGBO(0, 0, 0, 1), size: 20.0),
                        TextWidget(
                            text: '${controller.listComments.length ?? 0}',
                            size: AppDimens.textSize15),
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: controller.toggleFavoriteStatus,
                            child: Icon(
                              controller.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.isFavorite.value
                                  ? Colors.red
                                  : null,
                              size: 20.0,
                            ),
                          ),
                        ),
                        TextWidget(
                            text:
                                "${controller.postDataModel?.favoriteCount ?? 0}",
                            size: AppDimens.textSize15),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({
    super.key,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .35,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppDimens.radius1),
                        boxShadow: CustomShadow.cardShadow),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimens.radius1),
                      child: Column(
                        children: [
                          MainImageSlide(),
                          listImaegsSlider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height * .1,
            child: ButtonCotrolSlide(),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded MainImageSlide() {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        controller: controller.mainPageController,
        itemCount: controller.listImagesPostDetail.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => FullScreenImage(
                    initialIndex: index,
                    controller: controller,
                  ));
            },
            child: Image.network(
              controller.listImagesPostDetail[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row ButtonCotrolSlide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: controller.previousImage,
            icon: const Icon(Icons.chevron_left, size: 30, color: Colors.grey),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: controller.nextImage,
            icon: const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Expanded listImaegsSlider() {
    return Expanded(
      flex: 1,
      child: controller.listImagesPostDetail.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(5),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                ),
                itemCount: controller.listImagesPostDetail.length > 4
                    ? 4
                    : controller.listImagesPostDetail.length,
                itemBuilder: (context, index) {
                  if (index == 3 &&
                      controller.listImagesPostDetail.length > 4) {
                    return GestureDetector(
                      onTap: controller.showMoreImages,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.radius1),
                            child: Image.network(
                              controller.listImagesPostDetail[index],
                              fit: BoxFit.cover,
                              color: Colors.grey.withOpacity(0.6),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          Center(
                            child: Text(
                              '+${controller.listImagesPostDetail.length - 3}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => FullScreenImage(
                              initialIndex: index,
                              controller: controller,
                            ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppDimens.radius1),
                        child: Image.network(
                          controller.listImagesPostDetail[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          : Container(),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final int initialIndex;
  const FullScreenImage({
    super.key,
    required this.initialIndex,
    required this.controller,
  });

  final PostsDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: PageController(initialPage: initialIndex),
            itemCount: controller.listImagesPostDetail.length,
            onPageChanged: (index) {
              controller.currentIndex = index;
            },
            itemBuilder: (context, index) {
              return Center(
                child: Image.network(
                  controller.listImagesPostDetail[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
