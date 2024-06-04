import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/configs/app_text_string.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/icons/rating.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommentsCard extends StatelessWidget {
  // final String title;
  // final String imageUrl;
  // final double rate;
  // final int customerRated;
  // final double distance;
  // final String description;
  // final PostDataModel postDataModel;
  // bool activate;
  String idComment;
  int favorite;
  String comment;
  String authorAvatar;
  String authorName;
  String idPost;
  String createdAt;

  CommentsCard(
      {super.key,
      required this.idComment,
      required this.favorite,
      required this.comment,
      required this.authorAvatar,
      required this.authorName,
      required this.idPost,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
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
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              TextWidget(
                text: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
