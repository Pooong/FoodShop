import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_comment.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/comment_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart'; // Thêm import cho việc phân tích ngày tháng

class PostsDetailController extends GetxController {
  final GetuserUseCase _getuserUseCase;

  PostsDetailController(this._getuserUseCase);

  UserModel? userComment;
  List<CommentModel> listComments = [];
  PostDataModel? postDataModel;
  final dataAgument = Get.arguments;
  final commentController = TextEditingController();
  List<PostDataModel> postsDetail = [];
  List<dynamic> listImagesPostDetail = [];
  String timePosts = "";
  UserModel? authorPosts;
  bool isRestaurant = false;
  int currentIndex = 0;

  final PageController mainPageController = PageController();

  var isFavorite = false.obs;
  var isBookmark = false.obs;
  var isFavoriteComments = false.obs;

  var isLoading = false.obs;

  get commentFocusNode => null;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    userComment = await _getuserUseCase.getUser();
    if (dataAgument is PostDataModel) {
      postDataModel = dataAgument;
      listImagesPostDetail = postDataModel?.imageList ?? [];
      await getComments();
      timePosts = CaculateTime(postDataModel?.createAt);
      await getAuthorPost();
      update(['fetchDataTopPostDetail', 'checkAuthorPosts']);
    }

    isLoading.value = false;
  }

  refreshPostsDetail() async {
    super.onInit();
    isLoading.value = true;

    userComment = await _getuserUseCase.getUser();
    if (dataAgument is PostDataModel) {
      postDataModel = dataAgument;
      listImagesPostDetail = postDataModel?.imageList ?? [];
      await getComments();
      timePosts = CaculateTime(postDataModel?.createAt);
      await getAuthorPost();
      update(['fetchDataTopPostDetail', 'checkAuthorPosts']);
    }

    isLoading.value = false;
  }

  getAuthorPost() async {
    final result = await FirestoreUser.getUser(postDataModel!.userId!);
    if (result.status == Status.success) {
      authorPosts = result.data;
    }
  }

  // ignore: non_constant_identifier_names
  String CaculateTime(String? createAt) {
    if (createAt == null) {
      return "";
    }
    DateTime postCreationTime =
        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(createAt);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(postCreationTime);
    String timeAgo = _formatDuration(difference);
    return timeAgo;
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ago';
    } else {
      return '${duration.inSeconds}s ago';
    }
  }

  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  getComments() async {
    final result = await FirestoreComment.getListComments(dataAgument!.id!);
    if (result.status == Status.success) {
      listComments = result.data!;
      listComments.sort((a, b) {
        DateTime dateA = DateFormat("yyyy-MM-dd HH:mm:ss").parse(a.createdAt!);
        DateTime dateB = DateFormat("yyyy-MM-dd HH:mm:ss").parse(b.createdAt!);
        return dateB.compareTo(dateA);
      });
      update(["fetchComment"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  void uploadComment() async {
    // kiểm tra comments có rỗng
    if (commentController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Comment cannot be empty".tr);
      return;
    }
    // kiểm tra độ dài của comment
    const int maxCommentLength = 200; // Set the maximum comment length
    if (commentController.text.length > maxCommentLength) {
      Fluttertoast.showToast(
          msg: "Comment cannot exceed $maxCommentLength characters".tr);
      return;
    }
    final comment = CommentModel(
      author: userComment!,
      comment: commentController.text,
      favorite: 0,
      idPost: postDataModel!.id!,
      createdAt: DateTime.now().toString(),
      isFavoriteComments: false,
    );
    final result = await FirestoreComment.createComment(comment);
    if (result.status == Status.success) {
      listComments.insert(0, comment);
      update(["fetchComment"]);
      Fluttertoast.showToast(msg: "Add comments success".tr);
    } else {
      Fluttertoast.showToast(msg: "Add comments error".tr);
      Fluttertoast.showToast(msg: "Add comments error".tr);
    }
    commentController.clear();
    update();
  }

  // phương thức xóa bình luận
  void deleteComment(String idComment) async {
    print(idComment);
    final result = await FirestoreComment.deleteComment(idComment);
    if (result.status == Status.success) {
      listComments.removeWhere((element) => element.idComment == idComment);
      update(["fetchComment"]);
      Fluttertoast.showToast(msg: "Delete comments success".tr);
    } else {
      Fluttertoast.showToast(msg: "Delete comments error".tr);
    }
  }

  void previousImage() {
    if (currentIndex > 0) {
      currentIndex--;
      mainPageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void nextImage() {
    if (currentIndex < listImagesPostDetail.length - 1) {
      currentIndex++;
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

  void showDialogDeleteComment(String id) {
    DialogsUtils.showAlertDialog(
      title: "Delete comment",
      message: "Are you sure you want to delete this comment?",
      typeDialog: TypeDialog.warning,
      onPresss: () => (deleteComment(id)),
    );
  }

  void showMoreImages() {
    Get.dialog(
      AlertDialog(
        title: const Text('All images'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: listImagesPostDetail.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Image.network(
                  listImagesPostDetail[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('close'),
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

  bool hiddenStar(double star) => star == 0.0;

  List<String> listPathUrl = [];
  var selectedImages = <File>[].obs;

  UserModel? user;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

  void hideKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }
}
