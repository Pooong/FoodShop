import 'dart:io';

import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_comment.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/comment_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/features/model/commentsData.dart';
import 'package:image_picker/image_picker.dart';

class PostsDetailController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  PostsDetailController(this._getuserUseCase);
  UserModel? userComment;
  List<CommentModel> listComments = [];
  PostDataModel? postDataModel;
  final dataAgument = Get.arguments;
  final commentController = TextEditingController();
  @override
  void onInit() async {
    userComment = await _getuserUseCase.getUser();
    if (dataAgument is PostDataModel) {
      postDataModel = dataAgument;
      getComments();
    }

    // super.onInit();
  }

  void getComments() async {
    final result = await FirestoreComment.getListComments();
    // final result = await FirestoreComment.getListComments(postDataModel!.id!);
    if (result.status == Status.success) {
      listComments = result.data!;
      update(["fetchComment"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  void uploadComment() async {
    final comment = CommentModel(
      author: userComment!,
      comment: commentController.text,
      favorite: 0,
      idPost: postDataModel!.id!,
      createdAt: DateTime.now().toString(),
      isFavoriteComments: false,
      // imageList: listPathUrl,
    );

    final result = await FirestoreComment.createComment(comment);

    if (result.status == Status.success) {
      listComments.insert(0, comment); // Thêm bình luận mới vào đầu danh sách
      update(["fetchComment"]); // Cập nhật giao diện cho phần bình luận
      SnackbarUtil.show("Add comments success".tr);
    } else {
      SnackbarUtil.show("Add comments error".tr);
    }
    commentController.text = "";
    update();
  }

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
  var isFavoriteComments = false.obs;
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

  void toggleFavoriteComments(CommentModel comment) {
    comment.isFavoriteComments = !comment.isFavoriteComments!;
    update(["fetchComment"]);
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
    CommentData.commentDataList[index - 1]['isActive'] =
        !CommentData.commentDataList[index - 1]['isActive'];

    update(["fetchComment"]);
  }

  bool hiddenStar(double star) => star == 0.0;

  //up hinh anh comment

  List<String> listPathUrl = [];
  var selectedImages = <File>[].obs;

  UserModel? user;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  Future<String?> uploadFile({required File imageFile}) async {
    String? pathUrl;
    final result = await FirebaseStorageData.uploadImage(
        imageFile: imageFile, userId: user!.uid, collection: "post_images");
    if (result.status == Status.success) {
      pathUrl = result.data ?? "";
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
    return pathUrl;
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }
}
