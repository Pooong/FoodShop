import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/post_data_model.dart';
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

  final List<List<DocumentSnapshot>> _allPagedResults = [<DocumentSnapshot>[]];
  int pageLimit = 20;
  DocumentSnapshot? _lastDocument;

  bool _hasMoreData = true;

  bool isLoading = false; // Biến để theo dõi trạng thái tải dữ liệu

  @override
  void onInit() {
    super.onInit();
    _initialize();
    scrollController.addListener(_scrollListener);
    
  }

  Future<void> _initialize() async {
    user = await _getuserUseCase.getUser();
  }

  void _scrollListener() {
    if (scrollController.offset >=
            (scrollController.position.maxScrollExtent) &&
        !scrollController.position.outOfRange) {
      _getPosts();
    }
  }

  Stream<List<DocumentSnapshot>> listenToPostsRealTime() {
    _getPosts();
    return _postController.stream;
  }

  Future<void> _getPosts() async {
    if (!_hasMoreData || isLoading) return; // Kiểm tra nếu đang tải dữ liệu hoặc không còn dữ liệu để tải thêm thì không thực hiện tiếp

    isLoading = true; // Đặt trạng thái tải dữ liệu thành true

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

        _allPagedResults.add(generalChats);

        var allChats = _allPagedResults.fold<List<DocumentSnapshot>>(
            <DocumentSnapshot>[],
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        _postController.add(allChats);

        _lastDocument = snapshot.docs.elementAt(snapshot.docs.length - 1);

        _hasMoreData = generalChats.length == pageLimit;
      }
    } catch (e) {
      print("Error getting posts: $e");
    }
  }

  refreshPosts() {
    _hasMoreData = true;
    _allPagedResults.clear(); // Xóa hết các trang dữ liệu đã lưu
    _getPosts(); // Gọi lại hàm để lấy dữ liệu mới
    update(['fetchListPost']);
  }

  @override
  void onClose() {
    scrollController.dispose();
    _postController.close();
    super.onClose();
  }
}
