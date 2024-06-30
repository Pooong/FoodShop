import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/favorite_model.dart';
import 'package:find_food/features/model/post_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreFavorite {
  static final _fireStoreFavoriteCollection =
      FirebaseFirestore.instance.collection('favorites');

  static Future<Result<bool>> createFavorite(FavoriteModel favorite) async {
    try {
      String idfavorite =
          FirebaseFirestore.instance.collection('favorites').doc().id;
      favorite!.id = idfavorite;
      await _fireStoreFavoriteCollection.doc(favorite.id).set(favorite.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<bool> checkFavoriteExistsById(String favoriteId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _fireStoreFavoriteCollection.doc(favoriteId).get();
      return docSnapshot.exists;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkFavoriteExistsByUserAndPostId({required String userId,required String postId}) async {
    try {
      final snapshot = await _fireStoreFavoriteCollection
          .where('author.uid', isEqualTo: userId)
          .where('posts.id', isEqualTo: postId)
          .get();
      return snapshot.size > 0;
    } catch (e) {
      return false;
    }
  }

  static Future<int> countFavoritesByPostId(String postId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreFavoriteCollection
          .where('posts.id', isEqualTo: postId)
          .get();
      return snapshot.docs.length;
    } catch (e) {
      return 0;
    }
  }

  static Future<Result<List<UserModel>>> getUsersWhoFavoritedPost(
      String postId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreFavoriteCollection
          .where('posts.id', isEqualTo: postId)
          .get();
      List<UserModel> users = snapshot.docs
          .map((doc) =>
              UserModel.fromJson(doc['author'] as Map<String, dynamic>))
          .toList();
      return Result.success(users);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
  static Future<Result<List<PostDataModel>>> getFavoritedPostOfUser(
      String uid) async {
    try {
      QuerySnapshot snapshot = await _fireStoreFavoriteCollection
          .where('author.uid', isEqualTo: uid)
          .get();
      List<PostDataModel> users = snapshot.docs
          .map((doc) =>
              PostDataModel.fromJson(doc['posts'] as Map<String, dynamic>))
          .toList();
      return Result.success(users);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<String>>> getPostsFavoritedByUser(
      String userId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreFavoriteCollection
          .where('author.uid', isEqualTo: userId)
          .get();
      List<String> postIds =
          snapshot.docs.map((doc) => (doc['posts']['id'] as String)).toList();
      return Result.success(postIds);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> deleteFavoriteByUserAndPostId(
      {required String userId, required String postId}) async {
    try {
      QuerySnapshot snapshot = await _fireStoreFavoriteCollection
          .where('author.uid', isEqualTo: userId)
          .where('posts.id', isEqualTo: postId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await _fireStoreFavoriteCollection.doc(snapshot.docs.first.id).delete();
        return Result.success(null);
      } else {
        return Result.error(FirebaseAuthException(
          code: 'favorite-not-found',
          message: 'Favorite not found for the specified user and post.',
        ));
      }
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }


}
