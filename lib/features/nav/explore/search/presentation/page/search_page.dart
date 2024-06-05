import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/configs/app_text_string.dart';
import 'package:find_food/core/ui/widgets/appbar/explore_appbar.dart';
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
                    child: GetBuilder<ExploreController>(
                      id: "fetchPosts",
                      builder: (logic) {
                        return buildListPostArea();
                      },
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
                    child: GetBuilder<ExploreController>(
                      id: "fetchPosts",
                      builder: (logic) {
                        return buildListPostFavorite();
                      },
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
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
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


  Widget buildListPostArea() {
    if (controller.listPostArea.isEmpty) return const SizedBox.shrink();
    return Row(
      children: controller.listPostArea.map((postDataModel) {
        var imageUrl = postDataModel.imageList?.first;
        var title=postDataModel.title;
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ExploreFoodCard(
            
            imageUrl: imageUrl ?? AppImagesString.iCardDefault, title:title??AppTextString.fCardTitleDefault, rating: 2.5, customerRating: 10, distance: 2.1,
          ),
        );
      }).toList(),
    );
  }

  Widget buildListPostFavorite() {
    if (controller.listPostFavorite.isEmpty) return const SizedBox.shrink();
    return Row(
      children: controller.listPostFavorite.map((postDataModel) {
        var imageUrl = postDataModel.imageList?.first;
        var title=postDataModel.title;
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ExploreFoodCard(
            imageUrl: imageUrl ?? AppImagesString.iCardDefault, title: title ??AppTextString.fCardTitleDefault, rating: 2.5, customerRating: 10, distance: 2.1,
          ),
        );
      }).toList(),
    );
  }

}
