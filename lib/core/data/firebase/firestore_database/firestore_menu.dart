import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/model/result.dart';

import 'package:find_food/features/model/post_model.dart';
import 'package:find_food/features/restaurants/restaurant/pressentation/model/menu_food_restaurant_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMenu {
  static final _fireStoreUserCollection =
      FirebaseFirestore.instance.collection('menu');

  static Future<Result<bool>> createMenu(MenuModel newMenu) async {
    try {
      String menuId = FirebaseFirestore.instance.collection('menu').doc().id;
      newMenu!.id = menuId;
      await _fireStoreUserCollection.doc(newMenu.id).set(newMenu.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<bool>> updateMenu(MenuModel menu) async {
    try {
      await _fireStoreUserCollection.doc(menu.id).update(menu.toJson());
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<bool>> deleteMenu(String menuId) async {
    try {
      await _fireStoreUserCollection.doc(menuId).delete();
      return Result.success(true);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<MenuModel>>> getMenuList() async {
    try {
      final snapshot = await _fireStoreUserCollection.get();
      final menuList =
          snapshot.docs.map((doc) => MenuModel.fromJson(doc.data())).toList();
      return Result.success(menuList);
    } on FirebaseAuthException catch (e) {
      return Result.error(e);
    }
  }
}
