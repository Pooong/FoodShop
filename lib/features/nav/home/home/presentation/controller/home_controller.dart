import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final GetuserUseCase _getuserUseCase;

  HomeController(this._getuserUseCase);

  List<PostDataModel> listPost = [];

  UserModel? user;
  ScrollController scrollController = ScrollController();
  final StreamController<List<DocumentSnapshot>> _postController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  List<List<DocumentSnapshot>> _allPagedResults = [<DocumentSnapshot>[]];

  int pageLimit = 2;
  DocumentSnapshot? _lastDocument;
  bool _hasMoreData = true;


  @override
  void onInit() async {
    super.onInit();
    user = await _getuserUseCase.getUser();
    // getPolsts();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >=
            (scrollController.position.maxScrollExtent) &&
        !scrollController.position.outOfRange) {
      getPosts();
    }
  }

  Stream<List<DocumentSnapshot>> listenToPostsRealTime() {
    getPosts();
    return _postController.stream;
  }

  void getPosts() async {
    final CollectionReference _postCollectionReference =
        FirebaseFirestore.instance.collection('posts');
    var pagechatQuery = _postCollectionReference
        // .orderBy('createdAt', descending: true)
        .limit(pageLimit);

    if (_lastDocument != null) {
      pagechatQuery = pagechatQuery.startAfterDocument(_lastDocument!);
    }

    if (!_hasMoreData) return;
    print("_hasMoreData");
    var currentRequestIndex = _allPagedResults.length;
    pagechatQuery.snapshots().listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          var generalChats = snapshot.docs.toList();

          var pageExists = currentRequestIndex < _allPagedResults.length;

          if (pageExists) {
            _allPagedResults[currentRequestIndex] = generalChats;
          } else {
            _allPagedResults.add(generalChats);
          }

          var allChats = _allPagedResults.fold<List<DocumentSnapshot>>(
              <DocumentSnapshot>[],
              (initialValue, pageItems) => initialValue..addAll(pageItems));

          _postController.add(allChats);

          if (currentRequestIndex == _allPagedResults.length - 1) {
            _lastDocument = snapshot.docs.last;
          }

          _hasMoreData = generalChats.length == pageLimit;
        }
      },
    );
    // final result = await FirestorePostData.getListPost();
    // if (result.status == Status.success) {
    //   listPost = result.data!;
    //   update(["fetchPosts"]);
    // } else {
    //   SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    // }
  }

  @override
  void onClose() {
    scrollController.dispose();
  }
}
