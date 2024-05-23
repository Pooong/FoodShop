import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentCardWidget extends StatelessWidget {
  final int id;
  final String? authorImg;
  final String? authorName;
  final int? favorite;
  final String? comment;
  final double? star;

  const CommentCardWidget({
    super.key,  
    required this.id,
    this.authorImg = "assets/images/author.jpg",
    this.authorName = "author name",
    this.favorite = 10,
    this.comment = "writing your coment this here",
    this.star = 3.6,
  });



 // ignore: non_constant_identifier_names
 List<Icon> _star_caculator(double star) {
  if(star>5 ) star=5;
  if(star<0) star=0;

  bool halfStar = false;
  double ccl_1 = star % 1;

  int ccl_2 = star ~/ 1;

  if (ccl_1 > 0) halfStar = true;

  return <Icon>[
    for (var i = 1; i <= ccl_2; i++)
      const Icon(
        Icons.star_rounded,
        color: AppColors.yellow,
        size: AppDimens.textSize20,
      ),
    if (halfStar)
      const Icon(
        Icons.star_half_rounded,
        color: AppColors.yellow,
        size: AppDimens.textSize20,
      ),
    for (var i = ccl_2 + (halfStar ? 2 : 1); i <= 5; i++)
      const Icon(
        Icons.star_border_rounded,
        color: AppColors.yellow,
        size: AppDimens.textSize20,
      ),
  ];
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: 20, left: 10, right: 10),

          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 100),

          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(.15),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),

          // content comment
          child: Container(
            margin: const EdgeInsets.only(top: 35),
            padding: const EdgeInsets.only(left: 60, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: authorName!,
                ),
                Text(comment!),
              ],
            ),
          ),
        ),

        // icons favorate
        Positioned(
          top: 25,
          right: 60,
          child: FavoriteIcons(
            favorite: favorite!,
          ),
        ),


        // headline comment posts
        Positioned(
            left: 9,
            right: Get.width * 0.45,
            top: 20,
            child: Container(
              height: 30,
              padding: EdgeInsets.only(left: Get.width * 0.05),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.gray.withOpacity(.1), width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomRight: Radius.circular(40)),
                  color: AppColors.gray2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ..._star_caculator(star!),
                ]
              ),
            )),

        //customs avatar
        Positioned(
          left: 15,
          top: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(.2),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000),
                  child: Image.asset(
                    authorImg!,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextWidget(
                text: "2h ago",
                color: AppColors.primary,
                size: AppDimens.textSize10,
              )
            ],
          ),
        ),
      ],
    );
  }
}

// favorite function
class FavoriteIcons extends StatefulWidget {
  final int favorite;
  const FavoriteIcons({super.key, this.favorite = 0});
  @override

  // ignore: library_private_types_in_public_api
  _FavoriteIconsState createState() => _FavoriteIconsState();
}

class _FavoriteIconsState extends State<FavoriteIcons> {
  // khai báo biến sử dụng
  late bool active = false;
  late int quantityFavorite = 0;

  // ham ghi de tham so truyen vao
  @override
  void initState() {
    super.initState();
    quantityFavorite = widget.favorite;
  }

  void handleClick() {
    setState(() {
      active = !active;
      active ? quantityFavorite += 1 : quantityFavorite -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: handleClick,
          child: Icon(
            active ? Icons.favorite : Icons.favorite_border,
            color: active ? AppColors.red : null,
            size: AppDimens.textSize16,
          ),
        ),

        const SizedBox(
          width: 5,
        ),
        TextWidget(
          text: quantityFavorite.toString(),
          size: AppDimens.textSize16,
        ),
      ],
    );
  }
}
