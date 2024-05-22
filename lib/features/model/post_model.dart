class PostModel {
  final String? id;
  final String title;
  final String subtitle;
  final double rate;
  final List imageList;
  final String restaurantId;
  final String createAt;

  PostModel({
    this.id,
    required this.title,
    required this.subtitle,
    required this.rate,
    required this.imageList,
    required this.restaurantId,
    required this.createAt,
  });

  PostModel copyWith(
      {String? id,
      String? title,
      String? subtitle,
      double? rate,
      List? imageList,
      String? restaurantId,
      String? createAt}) {
    return PostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        rate: rate ?? this.rate,
        imageList: imageList ?? this.imageList,
        restaurantId: restaurantId ?? this.restaurantId,
        createAt: createAt ?? this.createAt);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'rate': rate,
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
      rate: json['rate'],
      imageList: json['imageList'],
      restaurantId: json['restaurantId'],
      createAt: json['createAt'],
    );
  }
}
