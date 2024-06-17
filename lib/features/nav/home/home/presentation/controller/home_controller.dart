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

  final List<DocumentSnapshot> _allPagedResults = [];
  int pageLimit = 10;
  DocumentSnapshot? _lastDocument;

  bool _hasMoreData = true;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _initialize();
    scrollController.addListener(_scrollListener);
    getPosts();  // Gọi getPosts ngay khi khởi tạo để lấy dữ liệu ban đầu
    update(['fetchPosts']);
  }

  Future<void> _initialize() async {
    user = await _getuserUseCase.getUser();
  }

  void _scrollListener() {
    if (scrollController.offset >=
            (scrollController.position.maxScrollExtent) &&
        !scrollController.position.outOfRange) {
      getPosts();
    }
  }

  Stream<List<DocumentSnapshot>> listenToPostsRealTime() {
    return _postController.stream;
  }

  Future<void> getPosts() async {
    if (!_hasMoreData || isLoading) return;

    isLoading = true;

    final CollectionReference postCollectionReference =
        FirebaseFirestore.instance.collection('posts');
    var pagechatQuery = postCollectionReference
        .orderBy('createAt', descending: true)
        .limit(pageLimit);

    if (_lastDocument != null) {
      pagechatQuery = pagechatQuery.startAfterDocument(_lastDocument!);
    }

    try {
      var snapshot = await pagechatQuery.get();
      if (snapshot.docs.isNotEmpty) {
        var generalChats = snapshot.docs.toList();

        _allPagedResults.addAll(generalChats);

        _postController.add(_allPagedResults);

        _lastDocument = snapshot.docs.last;

        _hasMoreData = generalChats.length == pageLimit;
      }
    } catch (e) {
      print("Error getting posts: $e");
    } finally {
      isLoading = false;
    }
  }
    Future<void> refreshPosts() async {
    _allPagedResults.clear();
    _lastDocument = null;
    _hasMoreData = true;
    await getPosts();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _postController.close();
    super.onClose();
  }
}
