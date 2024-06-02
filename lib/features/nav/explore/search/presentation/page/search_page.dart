import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/appbar/explore_appbar.dart';
import 'package:find_food/core/ui/widgets/card/explore_food_card.dart';
import 'package:find_food/core/ui/widgets/card/food_card.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
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
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.restaurant),
                  child: Text("to retaurant")),
              ElevatedButton(
                  onPressed: () => Get.toNamed('setrestaurant'),
                  child: Text("to setrestaurant")),

              /// list san pham 1
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
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // You can adjust the number of columns here
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount:
                        20, // Replace yourItemCount with the actual number of items
                    itemBuilder: (BuildContext context, int index) {
                      // Replace FoodCard with your custom widget
                      return FoodCard(
                        imageUrl:
                            'assets/images/home.png', // Replace with actual image URL
                        rating: 5, // Replace with actual rating
                        reviews: 23, // Replace with actual review count
                        distance: 1.2, // Replace with actual distance
                        title:
                            'this is title poaaaaaaaaassssssssssssssssaaaaast  ${index + 1}', // Replace with actual title
                      );
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
}
