import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/model/post_model.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final PostModel postModel;

  const ProfileCard({Key? key, required this.postModel}) : super(key: key);

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
            postModel.imageList[0],
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
                      Row(
                        children: [
                          Text(
                            postModel.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          // IconButton(
                          //   onPressed: () {
                          //     postModel.toggleFavorite();
                          //   },
                          //   icon: Icon(
                          //     postModel.isFavorited.value
                          //         ? Icons.favorite
                          //         : Icons.favorite_border,
                          //     color: postModel.isFavorited.value
                          //         ? AppColors.red
                          //         : AppColors.white,
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
