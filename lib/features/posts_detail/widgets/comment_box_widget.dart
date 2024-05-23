import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:find_food/features/model/commentsData.dart';
import 'package:find_food/features/posts_detail/widgets/comment_card_widget.dart';
import 'package:flutter/material.dart';
    
class CommentBoxWidget extends StatelessWidget {

  const CommentBoxWidget({ super.key });
  
  @override
  Widget build(BuildContext context) {
    var rate = 4.0;
    return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 2)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10),
                    itemCount: CommentData.commentDataList.length,
                    itemBuilder: (context, index) {
                      final data = CommentData.commentDataList[index];
                      return CommentCardWidget(
                        id: data['id'],
                        authorImg: data['authorImg'],
                        authorName: data['authorName'],
                        favorite: data['favorite'],
                        comment: data['comment'],
                        star: data['star'],
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    color: AppColors.gray2,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.gray.withOpacity(.6),
                                  )),
                              child: const TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your comment",
                                    hintStyle: TextStyle(color: AppColors.grey)),
                              )),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 15,
                            child: InkWell(
                              onTap: () => {
                                DialogsUtils.showRatingDialog(
                                  initialRating: rate,
                                  onRatingUpdate: (rating) {
                                    rate = rating;
                                  },
                                  onSubmit: () {
                                    print("Rating submitted");
                                    // Handle submit action
                                  },
                                ),
                              },
                              child: const Icon(
                                Icons.star_rounded,
                                size: AppDimens.textSize42,
                                color: AppColors.yellow,
                              ),
                            ),
                          ),
                        ],
                      )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset('assets/images/send.png'))
                    ],
                  ),
                )
              ],
            ),
          );

  }
}