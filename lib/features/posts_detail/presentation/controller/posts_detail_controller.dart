import 'package:find_food/features/model/commentsData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsDetailController extends GetxController {
  Route? onGenerateRoute(Route setting) {
    return null;
  }


  void updateComment(int index) {

    CommentData.commentDataList[index-1]['isActive'] =!CommentData.commentDataList[index-1]['isActive'];
    
    update(["fetchComment"]);
  }

  bool hiddenStar(double star) => star ==0.0;

}
