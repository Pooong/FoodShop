import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestorePostData {
  static final _fireStorePostCollection =
      FirebaseFirestore.instance.collection('posts');
      
  static Future<Result<PostDataModel>> savedPost(
      {required PostDataModel postDataModel, required String userId}) async {
    try {
      String activityId = _fireStorePostCollection.doc().id;
      postDataModel.id = activityId;
      postDataModel.userId = userId;
      await _fireStorePostCollection
          .doc(activityId)
          .set(postDataModel.toJson());
      return Result.success(postDataModel);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }



  static Future<Result<List<PostDataModel>>> getListPostOfUser(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStorePostCollection
          .where('userId', isEqualTo: userId)
          .get();

      List<PostDataModel> activityList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return PostDataModel.fromJson(data);
      }).toList();

      return Result.success(activityList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  
  static Future<Result<List<PostDataModel>>> getListPost() async {
    try {
      QuerySnapshot querySnapshot = await _fireStorePostCollection
          .get();

      List<PostDataModel> activityList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return PostDataModel.fromJson(data);
      }).toList();

      return Result.success(activityList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<PostDataModel>>> deletePost(String postId) async {
    try {
      await _fireStorePostCollection.doc(postId).delete();
      return Result.success([]);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<PostDataModel>>> searchPosts(String query) async {
  try {
    // Assuming you're searching in a field named 'title'
    QuerySnapshot querySnapshot = await _fireStorePostCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    List<PostDataModel> activityList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PostDataModel.fromJson(data);
    }).toList();

    return Result.success(activityList);
  } on FirebaseException catch (e) {
    return Result.error(e);
  }
}


  static Future<Result<List<PostDataModel>>> getListPostRelate({int limit = 10}) async {
  try {
    QuerySnapshot querySnapshot = await _fireStorePostCollection
        .limit(limit) // Apply the limit here
        .get();

    List<PostDataModel> activityList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PostDataModel.fromJson(data);
    }).toList();

    return Result.success(activityList);
  } on FirebaseException catch (e) {
    return Result.error(e);
  }
}


  static Future<Result<bool>> updatePost(PostDataModel postDataModel) async {
    try {
      await _fireStorePostCollection
          .doc(postDataModel.id)
          .update(postDataModel.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }
}
