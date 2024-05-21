import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsDetailPage extends GetView<PostsDetailController> {
  const PostsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          height: 500,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 3)
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 1; i <= 20; i++)
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                            bottom: i == 20 ? 20 : 0),
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
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )
                            ),
                        child: 
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.only(left: 55,right: 10, bottom: 15),
                            child: Text("This post really resonated with me. I’ve been struggling with issue for a while, and your insights have given me a new perspective. "),
                          )
                        ,
                      ),
                      Positioned(
                          left: 19,
                          right: Get.width * 0.35,
                          top: 20,
                          child: Container(
                            // width: ,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.gray.withOpacity(.2),
                                    width: 1.5),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(40)),
                                color: AppColors.gray2),
                          )),
                          
                      Positioned(
                        left: 25,
                        top: 25,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: AppColors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(.2),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10000),
                            child: Image.asset(
                              "assets/images/author.jpg",
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Container lineBetween() {
    return Container(
      height: 2,
      width: double.infinity,
      color: AppColors.gray2,
    );
  }
}
