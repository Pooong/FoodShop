import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/model/post_model.dart';

class FavoriteModel {
  UserModel author;
  PostModel posts;
  String? createdAt;

  FavoriteModel({
    required this.author,
    required this.posts,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author.toJson(),
      'posts': posts.toJson(),
      'createdAt': createdAt,
    };
  }

  static FavoriteModel fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      author: UserModel.fromJson(json['author']),
      posts: PostModel.fromJson(json['posts']),
      createdAt: json['createdAt'],
    );
  }
}
