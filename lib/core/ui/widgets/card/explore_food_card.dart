// ignore: camel_case_types
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/services/images_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreFoodCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final int customerRating;
  final double distance;

  const ExploreFoodCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.rating,
      required this.customerRating,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.postsDetail);
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 200, minWidth: 100),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: Get.width * .35,
        height: Get.height * .2,
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
              child: FutureBuilder<bool>(
                future: () async {
                  try {
                    return await ImagesService.doesImageLinkExist(imageUrl);
                  } catch (e) {
                    print('Error occurred while checking image link: $e');
                    return false;
                  }
                }(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    // Trạng thái đã có kết quả
                    if (snapshot.hasError) {
                      // Nếu có lỗi hoặc không tìm thấy hình ảnh, hiển thị hình ảnh mặc định
                      return Image.asset(
                        AppImagesString.iCardDefault,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      );
                    }
                  }
                },
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 150,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment
                          .bottomCenter, // Bắt đầu từ góc dưới bên trái
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
                          // overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
