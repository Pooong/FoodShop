import 'package:find_food/features/auth/user/model/user_model.dart';

class CommentModel {
  String? idComment;
  int? favorite;
  String? comment;
  UserModel author;
  String? idPost;
  String? createdAt;

  CommentModel({
    this.idComment,
    this.favorite,
    this.comment,
    required this.author,
    this.idPost,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'favorite': favorite,
      'comment': comment,
      'author': author.toJson(),
      'idPost': idPost,
      'createdAt': createdAt,
    };
  }

  static CommentModel fromJson(Map<String, dynamic> json) {
    return CommentModel(
      idComment: json['idComment'],
      favorite: json['favorite'],
      comment: json['comment'],
      author: UserModel.fromJson(json['author']),
      idPost: json['idPost'],
      createdAt: json['createdAt'],
    );
  }
}
