import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_interaction.dart';
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/post_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  HomeController(this._getuserUseCase);
  List<PostDataModel> listPost = [];
  Prefs prefs = Prefs.preferences;

  UserModel? user;
  ScrollController scrollController = ScrollController();
  final StreamController<List<DocumentSnapshot>> _postController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  List<String> listPostUserFavorite = [];

  final List<List<DocumentSnapshot>> _allPagedResults = [<DocumentSnapshot>[]];
  int pageLimit = 2;
  DocumentSnapshot? _lastDocument;
  bool _hasMoreData = true;
  bool isLoading = false; // Biến để theo dõi trạng thái tải dữ liệu
  List<DocumentSnapshot<Object?>> allChats = [];
  @override
  void onInit() {
    super.onInit();
    _initialize();
    scrollController.addListener(_scrollListener);
  }

  Future<void> _initialize() async {
    user = await _getuserUseCase.getUser();
    await _getListPostsUserFavorite();
  }

  _getListPostsUserFavorite() async {
    var result =
        await FirestoreFavorite.getPostsFavoritedByUser(user?.uid ?? "");
    if (result.status == Status.success) {
      listPostUserFavorite = result.data ?? [];
    }
  }

  void _scrollListener() async {
    if (scrollController.offset >=
            (scrollController.position.maxScrollExtent) &&
        !scrollController.position.outOfRange) {
      await getPosts();
    }
  }

  Stream<List<DocumentSnapshot>> listenToPostsRealTime() {
    getPosts();
    return _postController.stream;
  }

  Future<void> getPosts() async {
    if (!_hasMoreData || isLoading) {
      return; // Kiểm tra nếu đang tải dữ liệu hoặc không còn dữ liệu để tải thêm thì không thực hiện tiếp
    }

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

  Future<void> refreshPosts() async {
    _allPagedResults.clear();
    _lastDocument = null;
    _hasMoreData = true;
    await getPosts(); // Refresh posts from the beginning
  }

  @override
  void onClose() {
    scrollController.dispose();
    _postController.close();
    super.onClose();
  }
}
