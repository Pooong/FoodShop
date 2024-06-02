// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
    
// class PostsDetailController extends GetxController {

//       Route? onGenerateRoute(Route setting){
        
//         return null;
//       }
  



// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/features/model/commentsData.dart';

class PostsDetailController extends GetxController {

  
  final PageController mainPageController = PageController();
  final List<String> mainImages = [
    'assets/images/food1.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
    'assets/images/food4.png',
    'assets/images/food5.png',
    'assets/images/food6.png',
  ];

  final List<String> smallImages = [
    'assets/images/food1.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
    'assets/images/food4.png',
    'assets/images/food5.png',
    'assets/images/food6.png',
  ];

  var isFavorite = false.obs;
  var isBookmark = false.obs;

  void previousImage() {
    if (mainPageController.page!.toInt() > 0) {
      mainPageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void nextImage() {
    if (mainPageController.page!.toInt() < mainImages.length - 1) {
      mainPageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void toggleFavoriteStatus() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleBookmarkStatus() {
    isBookmark.value = !isBookmark.value;
  }

  void showMoreImages() {
    Get.dialog(
      AlertDialog(
        title: const Text('Tất cả ảnh'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: smallImages.length,
            itemBuilder: (context, index) {
              return Image.asset(
                smallImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    mainPageController.dispose();
    super.onClose();
  }
  Route? onGenerateRoute(Route setting) {
    return null;
  }


  void updateComment(int index) {

    CommentData.commentDataList[index-1]['isActive'] =!CommentData.commentDataList[index-1]['isActive'];
    
    update(["fetchComment"]);
  }

  bool hiddenStar(double star) => star ==0.0;
}