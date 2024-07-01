import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/bookmark_model.dart';
import 'package:find_food/features/model/post_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreBookmark {
  static final _fireStoreBookmarkCollection =
      FirebaseFirestore.instance.collection('bookmark');

  static Future<Result<bool>> createBookmark(BookmarkModel bookmark) async {
    try {
      String idBookmark =
          FirebaseFirestore.instance.collection('bookmark').doc().id;
      bookmark!.id = idBookmark;
      await _fireStoreBookmarkCollection
          .doc(bookmark.id)
          .set(bookmark.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<bool> checkBookmarkExistsById(String BookmarkId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _fireStoreBookmarkCollection.doc(BookmarkId).get();
      return docSnapshot.exists;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkBookmarkExistsByUserAndPostId(
      {required String userId, required String postId}) async {
    try {
      final snapshot = await _fireStoreBookmarkCollection
          .where('author.uid', isEqualTo: userId)
          .where('posts.id', isEqualTo: postId)
          .get();
      return snapshot.size > 0;
    } catch (e) {
      return false;
    }
  }

  static Future<Result<List<PostDataModel>>> getBoolmarkPostOfUser(
      String uid) async {
    try {
      QuerySnapshot snapshot = await _fireStoreBookmarkCollection
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

  static Future<int> countBookmarksByPostId(String postId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreBookmarkCollection
          .where('posts.id', isEqualTo: postId)
          .get();
      return snapshot.docs.length;
    } catch (e) {
      return 0;
    }
  }

  static Future<Result<List<UserModel>>> getUsersWhoBookmarkdPost(
      String postId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreBookmarkCollection
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

  static Future<Result<List<String>>> getPostsBookmarkdByUser(
      String userId) async {
    try {
      QuerySnapshot snapshot = await _fireStoreBookmarkCollection
          .where('author.uid', isEqualTo: userId)
          .get();
      print(userId);
      List<String> postIds =
          snapshot.docs.map((doc) => (doc['posts']['id'] as String)).toList();
      return Result.success(postIds);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> deleteBookmarkByUserAndPostId(
      {required String userId, required String postId}) async {
    try {
      QuerySnapshot snapshot = await _fireStoreBookmarkCollection
          .where('author.uid', isEqualTo: userId)
          .where('posts.id', isEqualTo: postId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await _fireStoreBookmarkCollection.doc(snapshot.docs.first.id).delete();
        return Result.success(null);
      } else {
        return Result.error(FirebaseAuthException(
          code: 'Bookmark-not-found',
          message: 'Bookmark not found for the specified user and post.',
        ));
      }
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}
