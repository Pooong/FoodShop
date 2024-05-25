import 'package:find_food/features/auth/user/model/user_model.dart';

class CommentModel {
  final String? id;
  final double favorite;
  final String comment;
  final UserModel author;

  CommentModel({
    this.id,
    required this.favorite,
    required this.comment,
    required this.author,
  });

  CommentModel copyWith({
    String? id,
    double? favorite,
    String? comment,
    double? rate,
    UserModel? author,
  }) {
    return CommentModel(
      id: id ?? this.id,
      favorite: favorite ?? this.favorite,
      comment: comment ?? this.comment,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite': favorite,
      'comment': comment,
      'author': author.toJson(),
    };
  }

  static CommentModel fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      favorite: json['favorite'],
      comment: json['comment'],
      author: UserModel.fromJson(json['author']),
    );
  }
}