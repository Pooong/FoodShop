import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/explore_appbar.dart';
import 'package:find_food/core/ui/widgets/card/explore_food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExploreAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// list  san pham 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Area",
                    style: TextStyle(
                        fontSize: AppDimens.textSize20,
                        fontWeight: FontWeight.w500),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          for (var i = 1; i <= 20; i++) const ExploreFoodCard(),
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
                  const title_custom(title: "Favorite"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          for (var i = 1; i <= 20; i++) const ExploreFoodCard(),
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
                  const Text(
                    "Relate",
                    style: TextStyle(
                        fontSize: AppDimens.textSize20,
                        fontWeight: FontWeight.w500),
                  ),
      
      
                  const SizedBox(height: 10,),
                  // Sử dụng Container để định chiều cao cố định cho GridView
                  SizedBox(
                    height: 400, // Chiều cao cố định cho GridView
                    child: GridView.count(
                      crossAxisCount: 2, // Số cột trong GridView
                      crossAxisSpacing: 10, // Khoảng cách ngang giữa các ô
                      mainAxisSpacing: 10, // Khoảng cách dọc giữa các ô
                      children: [
                        for (var i = 1;i<=20;i++) const ExploreFoodCard(),
                      ],
                    ),
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

// ignore: camel_case_types
class title_custom extends StatelessWidget {
  final String title;
  final Color? color;

  const title_custom({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: AppDimens.textSize20, fontWeight: FontWeight.w500),
    );
  }
}
