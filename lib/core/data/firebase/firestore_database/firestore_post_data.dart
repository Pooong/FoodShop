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

  static Future<Result<List<PostDataModel>>> getListPost(String userId) async {
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
