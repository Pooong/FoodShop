import 'dart:convert';

import 'package:find_food/core/configs/prefs_constants.dart';
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:get/get.dart';

class PostCardController extends GetxController {
  Prefs prefs = Prefs.preferences;
  List<dynamic> listDataFavorite = [];

  @override
  void onInit() {
    super.onInit();
    loadFavorite();
    update(['fetchStateIcon']);
  }

  void toggleStateIcons({String idPost = "1"}) async {
    await saveFavoriteState(idPost: idPost);
    update(['fetchStateIcon']);
  }

  loadFavorite() async {
    try {
      var result = await prefs.get(PrefsConstants.favorite);
      var newData = jsonDecode(result);
      listDataFavorite = newData;
    } catch (e) {
      listDataFavorite = [];
    }
  }

  Future<void> saveFavoriteState({String idPost = "1"}) async {
    try {
      var result = await prefs.get(PrefsConstants.favorite);
      if (result != null) {
        var newData = jsonDecode(result);
        if (!newData.contains(idPost)) {
          newData.add(idPost);
        } else {
          newData.remove(idPost);
        }
        listDataFavorite = newData;
        await prefs.set(PrefsConstants.favorite, jsonEncode(listDataFavorite));
      }
    } catch (e) {
      listDataFavorite.add(idPost);
      await prefs.set(PrefsConstants.favorite, jsonEncode(listDataFavorite));
    }
  }

  void getFavoriteCase() async {
    try {
      var result = await prefs.get(PrefsConstants.favorite);
      print("Favorite items: $result");
    } catch (e) {
      print("Error retrieving favorite: $e");
    }
  }
}
