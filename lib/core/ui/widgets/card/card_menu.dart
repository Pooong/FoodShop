// import 'package:flutter/cupertino.dart';

// class CardMenu extends StatelessWidget {
//   const CardMenu({super.key});
//   String imgFood;
//   String nameFood;
//   String priceFood;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       // Set the clip behavior of the card
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       // Define the child widgets of the card
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Flexible(
//             child: Image(
//               image: AssetImage(foodmenu.imageFood),
//               height: 160,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Add a container with padding that contains the card's title, text, and buttons
//           Container(
//             decoration: const BoxDecoration(
//                 border: Border(
//               top: BorderSide(color: AppColors.primary, width: 5.0),
//             )),
//             padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // Display the card's title using a font size of 24 and a dark grey color
//                 Text(
//                   foodmenu.foodName,
//                   maxLines: 1,
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//                 // Add a space between the title and the text
//                 Container(height: 10),
//                 // Display the card's text using a font size of 15 and a light grey color
//                 Text(
//                   "Price: \$${foodmenu.priceFood}",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//                 // Add a row with two buttons spaced apart and aligned to the right side of the card
//               ],
//             ),
//           ),
//           // Add a small space between the card and the next widget
//           Container(height: 5),
//         ],
//       ),
//     );
//   }
// }
