import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardMenuRestaurant extends StatelessWidget {
  final String img;
  final String foodname;
  final String pricefood;
  const CardMenuRestaurant(
      {super.key,
      required this.img,
      required this.foodname,
      required this.pricefood});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Set the clip behavior of the card
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widgets of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage(img),
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Add a container with padding that contains the card's title, text, and buttons
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(color: AppColors.primary, width: 5.0),
            )),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the card's title using a font size of 24 and a dark grey color
                Text(
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  foodname,
                  // maxLines: 1,
                  style: TextStyle(
                    fontSize: AppDimens.textSize18,
                    color: Colors.grey[800],
                  ),
                ),
                // Add a space between the title and the text
                Container(height: 10),
                // Display the card's text using a font size of 15 and a light grey color
                Text(
                  "Price: \$${pricefood}",
                  style: TextStyle(
                    fontSize: AppDimens.textSize14,
                    color: Colors.grey[700],
                  ),
                ),
                // Add a row with two buttons spaced apart and aligned to the right side of the card
              ],
            ),
          ),
          // Add a small space between the card and the next widget
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CardMenuRestaurant extends StatelessWidget {
//   final String img;
//   final String foodname;
//   final String pricefood;

//   const CardMenuRestaurant({
//     super.key,
//     required this.img,
//     required this.foodname,
//     required this.pricefood,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Flexible(
//             flex: 2,
//             child: Image(
//               image: AssetImage(img),
//               height: 160,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Text(
//               foodname,
//               maxLines: 3,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[800],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Flexible(
//             flex: 1,
//             child: Text(
//               textAlign: TextAlign.end,
//               "Price: \$$pricefood",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[700],
//               ),
//             ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     border: Border(
          //       top: BorderSide(color: Colors.blue, width: 5.0),
          //     ),
          //   ),
          //   padding: const EdgeInsets.all(15),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         foodname,
          //         maxLines: 1,
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Colors.grey[800],
          //         ),
          //       ),
          //       SizedBox(height: 10),
          //       Text(
          //         "Price: \$${pricefood}",
          //         style: TextStyle(
          //           fontSize: 14,
          //           color: Colors.grey[700],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
//         ],
//       ),
//     );
//   }
// }
