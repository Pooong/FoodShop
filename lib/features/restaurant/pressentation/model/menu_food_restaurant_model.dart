import 'restaurant_model.dart';

class MenuModel {
  String? id;
  String? name;
  double? price;
  String? image;
  SetRestaurant? idRestaurant;

  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.idRestaurant,
  });
  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      idRestaurant: SetRestaurant.fromJson(json['restaurant']));

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'restaurant': idRestaurant?.toJson()
    };
  }
}
