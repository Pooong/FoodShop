// ignore: camel_case_types
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';

class ExploreFoodCard extends StatelessWidget {
  const ExploreFoodCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 150,
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
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
            'assets/images/food_1.png',
            fit: BoxFit.cover,
          )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 100,
                width: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment
                        .bottomCenter, // Bắt đầu từ góc dưới bên trái
                    end: Alignment
                        .topCenter, // Kết thúc ở góc trên bên phải
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Title post this here ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w500), 
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              Text(
                                "3.5",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppDimens.textSize15),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: AppColors.yellow,
                                size: AppDimens.textSize20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "(100)",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppDimens.textSize10),
                              ),
                            ],
                          ),
                          Text(
                            "2.5 km",
                            style: TextStyle(
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