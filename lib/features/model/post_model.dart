import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    String createdAt;
    int favorites;
    String postId;
    List<String> imageList;
    String restaurantId;
    String description;
    String title;

    PostModel({
        required this.createdAt,
        required this.favorites,
        required this.postId,
        required this.imageList,
        required this.restaurantId,
        required this.description,
        required this.title,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        createdAt: json["createdAt"],
        favorites: json["favorites"],
        postId: json["postId"],
        imageList: List<String>.from(json["imageList"].map((x) => x)),
        restaurantId: json["restaurantId"],
        description: json["description"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "favorites": favorites,
        "postId": postId,
        "imageList": List<String>.from(imageList.map((x) => x)),
        "restaurantId": restaurantId,
        "description": description,
        "title": title,
    };
}