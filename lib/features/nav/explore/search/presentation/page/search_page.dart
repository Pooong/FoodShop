import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/ui/widgets/appbar/explore_appbar.dart';
import 'package:find_food/core/ui/widgets/avatar/avatar.dart';
import 'package:find_food/core/ui/widgets/card/explore_food_card.dart';
import 'package:find_food/core/ui/widgets/card/posts_card.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/nav/explore/search/presentation/controller/search_controller.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<ExploreController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExploreAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Area",
                    size: AppDimens.textSize20,
                    fontWeight: FontWeight.w500,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          for (var i = 1; i <= 20; i++)
                            Container(
                                padding: const EdgeInsets.only(right: 20),
                                child: const ExploreFoodCard()),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(color: AppColors.gray),
                      )
                    ],
                  )
                ],
              ),

              // list san pham 2
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Favorite",
                    size: AppDimens.textSize20,
                    fontWeight: FontWeight.w500,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          for (var i = 1; i <= 20; i++)
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const ExploreFoodCard(),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(color: AppColors.gray),
                      )
                    ],
                  )
                ],
              ),

              // GridView mới thêm
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Relate",
                    size: AppDimens.textSize22,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<ExploreController>(
                    id: "fetchPosts",
                    builder: (logic) {
                      return buildListPost();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListPost() {
    return controller.listPost.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listPost.length,
            itemBuilder: (_, index) {
              PostDataModel postDataModel = controller.listPost[index];
              return PostsCard(
                postDataModel: postDataModel,
              );
            })
        : const SizedBox.shrink();
  }
}
