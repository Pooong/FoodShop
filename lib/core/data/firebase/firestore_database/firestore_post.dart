import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';

import 'package:find_food/features/model/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestorePost {
  static final _fireStoreUserCollection =
      FirebaseFirestore.instance.collection('posts');

  static Future<Result<bool>> createPost(PostModel newPost) async {
    try {
      String postId = FirebaseFirestore.instance.collection('posts').doc().id;
      newPost!.postId = postId;
      await _fireStoreUserCollection
          .doc(newPost.postId)
          .set(newPost.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  

}
