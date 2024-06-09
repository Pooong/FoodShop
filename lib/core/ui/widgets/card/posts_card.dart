import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/core/utils/calculator_utils.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';

// ignore: must_be_immutable
class PostsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rate;
  final int customerRated;
  final PostDataModel postDataModel;
  final bool activate;
  bool? restaurantTag ;

  PostsCard(
      {super.key,
      this.title = "Default Title",
      this.imageUrl = AppImagesString.iCardDefault,
      this.rate = 4.5,
      this.customerRated = 20,
      required this.postDataModel,
      this.activate = false,
      this.restaurantTag=true});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: distanceCalculate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          double distance = snapshot.data ?? 0.0;
          return Container(
            margin: const EdgeInsets.all(10),
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
                    onTap: () {
                      Get.toNamed(Routes.postsDetail, arguments: postDataModel);
                    },
                    child: postDataModel.imageList != null &&
                            postDataModel.imageList!.isNotEmpty
                        ? Image.network(
                            postDataModel.imageList!.first,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextWidget(
                              text: postDataModel.title ?? title,
                              size: AppDimens.textSize20,
                              fontWeight: FontWeight.w500,
                              maxLines: 2,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const Icon(
                                Icons.favorite_border,
                                size: AppDimens.textSize16,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          postDataModel.subtitle!.trim(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                        ),
                      ),
                      restaurantTag==true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      rate.toString(),
                                      style: const TextStyle(
                                          fontSize: AppDimens.textSize22,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(width: 5),
                                    Row(
                                      children: [
                                        ...Rating.RenderStar(
                                            star: rate,
                                            sizeStar: AppDimens.textSize22)
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    TextWidget(
                                      text: "($customerRated)",
                                      size: AppDimens.textSize14,
                                    ),
                                    const SizedBox(width: 5),
                                    TextWidget(
                                      text: "${distance.toStringAsFixed(2)} km",
                                      size: AppDimens.textSize10,
                                    ),
                                  ],
                                ),
                                TextWidget(
                                  text: activate ? "Closed" : "Opening",
                                  color: activate
                                      ? AppColors.red
                                      : AppColors.greenBold,
                                  size: AppDimens.textSize12,
                                )
                              ],
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextWidget(
                                    text: "${distance.toStringAsFixed(2)} km",
                                    size: AppDimens.textSize10,
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Future<double> distanceCalculate() async {
    final LocationService locationService = Get.find<LocationService>();
    var placeMap = await locationService.getLocation();

    if (placeMap != null) {
      double placeLat = placeMap.lat ?? 0.0;
      double placeLon = placeMap.lon ?? 0.0;
      double postLat = postDataModel.latitude ?? 0.0;
      double postLon = postDataModel.longitude ?? 0.0;
      double distance = CalculatorUtils.calculateDistance(
          placeLat, placeLon, postLat, postLon);
      return double.parse(distance.toStringAsFixed(2));
    }
    return 0.0;
  }
}
