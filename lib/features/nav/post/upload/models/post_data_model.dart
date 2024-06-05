import 'package:cloud_firestore/cloud_firestore.dart';

class PostDataModel {
  String? id;
  String? userId;
  String? title;
  String? subtitle;
  int? favoriteCount;
  List<String>? imageList;
  String? restaurantId;
  String? createAt;
  bool? isBookmarked;
  bool? isFavorited;
  double? latitude;
  double? longitude;

  PostDataModel({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.favoriteCount,
    this.imageList,
    this.restaurantId,
    this.createAt,
    this.isBookmarked,
    this.isFavorited,
    this.latitude,
    this.longitude,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        favoriteCount: json["favoriteCount"],
        imageList: json["imageList"] == null
            ? []
            : List<String>.from(json["imageList"]!.map((x) => x)),
        restaurantId: json["restaurantId"],
        createAt: json["createAt"],
        isBookmarked: json["isBookmarked"],
        isFavorited: json["isFavorited"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
// Chuyển đổi từ DocumentSnapshot sang PostModel
  factory PostDataModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data()! as Map<String, dynamic>;
    return PostDataModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      subtitle: json["subtitle"],
      favoriteCount: json["favoriteCount"],
      imageList: json["imageList"] == null
          ? []
          : List<String>.from(json["imageList"]!.map((x) => x)),
      restaurantId: json["restaurantId"],
      createAt: json["createAt"],
      isBookmarked: json["isBookmarked"],
      isFavorited: json["isFavorited"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        "favoriteCount": favoriteCount,
        "imageList": imageList == null
            ? []
            : List<dynamic>.from(imageList!.map((x) => x)),
        "restaurantId": restaurantId,
        "createAt": createAt,
        "isBookmarked": isBookmarked,
        "isFavorited": isFavorited,
        "latitude": latitude,
        "longitude": longitude,
      };
}
