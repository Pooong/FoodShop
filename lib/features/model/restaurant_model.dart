class RestaurantModel {
  String? idRestaurant;
  String? userId;

  String? nameRestaurant;
  String? emailRestaurant;
  String? phoneRestaurant;
  String? addressRestaurant;

  List<String>? listPathUrl;
  String? avatarUrl;
  String? backgroundUrl;

  RestaurantModel({
    this.idRestaurant,
    this.userId,
    this.nameRestaurant,
    this.emailRestaurant,
    this.phoneRestaurant,
    this.addressRestaurant,
    this.listPathUrl,
    this.avatarUrl,
    this.backgroundUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'idRestaurant': idRestaurant,
      'userId': userId,
      'nameRestaurant': nameRestaurant,
      'emailRestaurant': emailRestaurant,
      'phoneRestaurant': phoneRestaurant,
      'addressRestaurant': addressRestaurant,
      'listPathUrl': listPathUrl,
      'avatarUrl': avatarUrl ?? '',
      'backgroundUrl': backgroundUrl ?? '',
    };
  }

  static RestaurantModel fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      idRestaurant: json['idRestaurant'],
      userId: json['userId'],
      nameRestaurant: json['nameRestaurant'],
      emailRestaurant: json['emailRestaurant'],
      phoneRestaurant: json['phoneRestaurant'],
      addressRestaurant: json['addressRestaurant'],
      listPathUrl: List<String>.from(json['listPathUrl'].map((x) => x)),
      avatarUrl: json['avatarUrl'],
      backgroundUrl: json['backgroundUrl'],
    );
  }
}
