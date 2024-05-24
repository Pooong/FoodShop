import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PostsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final int customerRated;
  final double distance;
  final String description;

  bool activate;

  PostsCard(
      {super.key,
      this.title =
          "writing title post this here writing title post this herewriting title post this herewriting title post this herewriting title post this herewriting title post this herewriting title post this herewriting title post this herewriting title post this herewriting title post this here  .... ",
      this.imageUrl = "assets/images/img_post_card.jpg",
      this.rating = 4.6,
      this.customerRated = 200,
      this.distance = 2.5,
      this.description = "Write descrtion this here plasee",
      this.activate = true});

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.all(10);
    const double starIconSize = AppDimens.textSize22;

    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
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
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.postsDetail),
                    child: Image.asset(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: title,
                        size: AppDimens.textSize20,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(description),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                rating.toString(),
                                style: const TextStyle(
                                    fontSize: starIconSize,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 5),
                              Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return const Icon(Icons.star,
                                        color: Colors.yellow,
                                        size: starIconSize);
                                  } else {
                                    return const Icon(Icons.star_border,
                                        color: Colors.yellow,
                                        size: starIconSize);
                                  }
                                }),
                              ),
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
                            text: activate ? "Opening" : "Close",
                            color:
                                activate ? AppColors.greenBold : AppColors.red,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
