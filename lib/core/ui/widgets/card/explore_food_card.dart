// ignore: camel_case_types
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';


class ExploreFoodCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final int customerRating;
  final double distance;

  const ExploreFoodCard(
      {super.key,
      this.title = "posts no title plase add your's title",
      this.imageUrl = 'assets/images/defaults/default_posts.png',
      this.rating = 5.0,
      this.customerRating = 100,
      this.distance = 2.0,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(2, 0),
        ),
      ]),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,  
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 150,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin:
                        Alignment.bottomCenter, // Bắt đầu từ góc dưới bên trái
                    end: Alignment.topCenter, // Kết thúc ở góc trên bên phải
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(
                                "$rating",
                                style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppDimens.textSize15),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.yellow,
                                size: AppDimens.textSize20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "($customerRating)",
                                style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppDimens.textSize10),
                              ),
                            ],
                          ),
                          Text(
                            "$distance km",
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: AppDimens.textSize10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
