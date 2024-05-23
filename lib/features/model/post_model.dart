import 'package:get/get.dart';

class PostModel {
  final String? id;
  final String title;
  final String subtitle;
  final RxInt favoriteCount;
  final List<String> imageList;
  final String? restaurantId;
  final String createAt;
  final RxBool isBookmarked;
  final RxBool isFavorited;

  PostModel({
    this.id,
    required this.title,
    required this.subtitle,
    int favoriteCount = 0,
    required this.imageList,
    required this.restaurantId,
    required this.createAt,
  })  : favoriteCount = RxInt(favoriteCount),
        isBookmarked = false.obs,
        isFavorited = false.obs;

  PostModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    int? favoriteCount,
    List<String>? imageList,
    String? restaurantId,
    String? createAt,
    RxBool? isBookmarked,
    RxBool? isFavorited,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      favoriteCount: favoriteCount ?? this.favoriteCount.value,
      imageList: imageList ?? this.imageList,
      restaurantId: restaurantId ?? this.restaurantId,
      createAt: createAt ?? this.createAt,
    );
  }

  void toggleFavorite() {
    isFavorited.value = !isFavorited.value;
    if (isFavorited.value) {
      favoriteCount.value += 1;
    } else {
      favoriteCount.value -= 1;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'favoriteCount': favoriteCount.value,
      'imageList': imageList,
      'restaurantId': restaurantId,
      'createAt': createAt,
    };
  }

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      favoriteCount: json['favoriteCount'],
      imageList: List<String>.from(json['imageList']),
      restaurantId: json['restaurantId'],
      createAt: json['createAt'],
    );
  }
}
