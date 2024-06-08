import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isVisible = true;

class TopPostsDetail extends GetView<PostsDetailController> {
  const TopPostsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const CircleAvatar(
                radius: AppDimens.textSize28,
                backgroundImage: AssetImage('assets/images/author.jpg'),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write title posts this here',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '2 hours ago - Author posts',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  Obx(
                    () => IconButton(
                      onPressed: controller.toggleBookmarkStatus,
                      icon: Icon(
                        controller.isBookmark.value
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color:
                            controller.isBookmark.value ? Colors.yellow : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Writing this post's description this here ...."),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2.0,
                                  blurRadius: 2.0,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: PageView.builder(
                                      controller: controller.mainPageController,
                                      itemCount: controller.mainImages.length,
                                      itemBuilder: (context, index) {
                                        return Image.asset(
                                          controller.mainImages[index],
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    flex: 1,
                                    child: controller.smallImages.isNotEmpty
                                        ? GridView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              // xác định số lượng cột
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                            ),
                                            itemCount: controller
                                                        .smallImages.length >
                                                    4
                                                ? 4
                                                : controller.smallImages.length,
                                            itemBuilder: (context, index) {
                                              if (index == 3 &&
                                                  controller
                                                          .smallImages.length >
                                                      4) {
                                                return GestureDetector(
                                                  onTap:
                                                      controller.showMoreImages,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.asset(
                                                          controller
                                                                  .smallImages[
                                                              index],
                                                          fit: BoxFit.cover,
                                                          color: Colors.grey
                                                              .withOpacity(0.6),
                                                          colorBlendMode:
                                                              BlendMode.darken,
                                                        ),
                                                      ),
                                                      const Center(
                                                        child: Text(
                                                          '+2',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                    controller
                                                        .mainPageController
                                                        .animateToPage(
                                                      index,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves
                                                          .ease, //đường cong cho hiệu ứng hoạt hình
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.asset(
                                                      controller
                                                          .smallImages[index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: controller.previousImage,
                        icon: const Icon(Icons.chevron_left,
                            size: 30, color: Colors.grey),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: controller.nextImage,
                        icon: const Icon(Icons.chevron_right,
                            size: 30, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20.0),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20.0),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20.0),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20.0),
                              const Icon(Icons.star_border,
                                  color: Colors.amber, size: 20.0),
                              const Text(
                                "(100)",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Column(
                                      children: [
                                        Icon(Icons.comment,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            size: 20.0),
                                        TextWidget(
                                            text: "100",
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
                                            onTap:
                                                controller.toggleFavoriteStatus,
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
                                        const TextWidget(
                                            text: "100",
                                            size: AppDimens.textSize15),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.black, size: 20.0),
                              SizedBox(width: 5),
                              Text(
                                "2.7km",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                " Đang hoạt động ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2.0,
                            blurRadius: 2.0,
                            offset: const Offset(0, 1),
                          )
                        ]),
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
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
