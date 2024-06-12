class RestaurantModel {
  String idRestaurant;
  String nameRestaurant;
  String emailRestaurant;
  String phoneRestaurant;
  String addressRestaurant;
  List<String> listPathUrl;

  RestaurantModel({
    required this.idRestaurant,
    required this.nameRestaurant,
    required this.emailRestaurant,
    required this.phoneRestaurant,
    required this.addressRestaurant,
    required this.listPathUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'idRestaurant': idRestaurant,
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
      nameRestaurant: json['nameRestaurant'],
      emailRestaurant: json['emailRestaurant'],
      phoneRestaurant: json['phoneRestaurant'],
      addressRestaurant: json['addressRestaurant'],
      listPathUrl: List<String>.from(json['listPathUrl'].map((x) => x)),
    );
  }
}
