class RestaurantModel {
  String? idRestaurant;
  String? userId;

  String? nameRestaurant;
  String? emailRestaurant;
  String? phoneRestaurant;
  String? addressRestaurant;

  List<String>? listPathUrl;

  RestaurantModel({
    this.idRestaurant,
    this.userId,
    this.nameRestaurant,
    this.emailRestaurant,
    this.phoneRestaurant,
    this.addressRestaurant,
    this.listPathUrl,
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
    );
  }
}
