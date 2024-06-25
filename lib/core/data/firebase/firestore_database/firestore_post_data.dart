import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/features/model/post_data_model.dart';
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

  static Future<Result<List<PostDataModel>>> getListPostOfUser(
      String userId) async {
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

  static Future<Result<List<PostDataModel>>> getListBookmarkedPosts(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStorePostCollection
          .where('isBookmarked', arrayContains: userId)
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

  static Future<Result<List<PostDataModel>>> getListFavoritePosts(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStorePostCollection
          .where('isFavorited', arrayContains: userId)
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
      QuerySnapshot querySnapshot = await _fireStorePostCollection.get();

      List<PostDataModel> activityList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return PostDataModel.fromJson(data);
      }).toList();

      return Result.success(activityList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<PostDataModel>>> getListPostRelate(
      {int limit = 10}) async {
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

  static Future<Result<List<PostDataModel>>> getListPostArea(
      {int limit = 10}) async {
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

  static Future<Result<List<PostDataModel>>> getListPostFavorite(
      {int limit = 10}) async {
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

  static Future<Result<bool>> deletePost(String postId) async {
    try {
      await _fireStorePostCollection.doc(postId).delete();
      return Result.success(true);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<PostDataModel>> getPost(String postId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _fireStorePostCollection.doc(postId).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> postData =
            documentSnapshot.data() as Map<String, dynamic>;
        return Result.success(PostDataModel.fromJson(postData));
      } else {
        return Result.error(FirebaseAuthException(
            code: 'post-not-found',
            message: 'No post found with the provided ID.'));
      }
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(
          FirebaseAuthException(code: 'unknown-error', message: e.toString()));
    }
  }

  static Future<Result<List<PostDataModel>>> searchPosts(String query) async {
    try {
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

  static Future<Result<bool>> updateField(
      String postId, Map<String, dynamic> data) async {
    try {
      await _fireStorePostCollection.doc(postId).update(data);
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<bool>> incrementFavoriteCount(String postId) async {
    try {
      await _fireStorePostCollection.doc(postId).update({
        'favoriteCount': FieldValue.increment(1),
      });
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<bool>> decrementFavoriteCount(String postId) async {
  try {
    await _fireStorePostCollection.doc(postId).update({
      'favoriteCount': FieldValue.increment(-1),
    });
    return Result.success(true);
  } on FirebaseAuthException catch (e) {
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
