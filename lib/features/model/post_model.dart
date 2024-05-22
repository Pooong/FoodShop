// import 'package:flutter/foundation.dart';

// class Post {
//   final String? id;
//   final String title;
//   final String subtitle;
//   final double rate;
//   final List imageList;
//   final String restaurantId;
//   final String date;

//   Post({
//     this.id,
//     required this.title,
//     required this.subtitle,
//     required this.rate,
//     required this.imageList,
//     required this.restaurantId,
//     required this.date,
    
//   }) ;

//   Post copyWith(
//       {String? id,
//         String? title,
//         String? subtitle,
//         double? rate,
//         List? imageList,
//         String? restaurantId,
//         bool? isFavorite}) {
//     return Post(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         subtitle: subtitle ?? this.subtitle,
//         rate: rate ?? this.rate,
//         imageList: imageList ?? this.imageList,
//         restaurantId: restaurantId ?? this.restaurantId,
//         isFavorite: isFavorite ?? this.isFavorite);
//   }

//   // set isFavorite(bool newValue) {
//   //   _isFavorite.value = newValue;
//   // }

//   // bool get isFavorite {
//   //   return _isFavorite.value;
//   // }

//   // ValueNotifier<bool> get isFavoriteListenable {
//   //   return _isFavorite;
//   // }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'subtitle': subtitle,
//       'rate': rate,
//       'imageList': imageList,
//       'restaurantId': restaurantId,
//     };
//   }

//   static Post fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       subtitle: json['subtitle'],
//       rate: json['rate'],
//       imageList: json['imageList'],
//       restaurantId: json['restaurantId'],
//     );
//   }
// }
