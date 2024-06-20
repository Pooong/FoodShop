class RestaurantModel {
  String? idRestaurant;
  String? userId;

  String? nameRestaurant;
  String? emailRestaurant;
  String? phoneRestaurant;
  String? addressRestaurant;

  List<String>? licenseRestaurant;
  List<String>? onwnerLicenseImages;
  String? avatarUrl;
  String? backgroundUrl;

  RestaurantModel({
    this.idRestaurant,
    this.userId,
    this.nameRestaurant,
    this.emailRestaurant,
    this.phoneRestaurant,
    this.addressRestaurant,
    this.licenseRestaurant,
    this.onwnerLicenseImages,
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
      'licenseRestaurant': licenseRestaurant ?? '',
      'onwnerLicenseImages': onwnerLicenseImages ?? '',
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
      licenseRestaurant:
          List<String>.from(json['licenseRestaurant'].map((x) => x)),
      onwnerLicenseImages:
          List<String>.from(json['onwnerLicenseImages'].map((x) => x)),
      avatarUrl: json['avatarUrl'],
      backgroundUrl: json['backgroundUrl'],
    );
  }
}
