import 'package:find_food/core/extensions/color.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFEB2F06);
  static const primary2 = Color(0xFFFF5722);
  static const secondary = Color.fromARGB(255, 247, 144, 112);
  
  static const grey = Color(0xFFACACAC);
  static const grey1 = Color(0xFF9DA8C3);
  static const grey2 = Color(0xFFF1F1F1);
  static const black = Color(0xFF020112);
  static const white = Color(0xFFFFFFFF);
  
  static const transparent = Colors.transparent;
  static const error = Color(0xFFF83758);
  static const colorPink = Color(0xFF9FA8DA);
  static Color colorPink2 = HexColor('#b20088');
  static Color colorPink3 = HexColor('#f5ecef');
  static Color black4 = HexColor('#1F1F1F');
  static Color red = HexColor('#FF0000');
  static Color greenBold = HexColor('#4CAF50');
  static Color yellow1 = HexColor('#FFBA00');
  static Color yellow2 = HexColor('#FFD974');
  static Color yellow3 = HexColor('#FFBA00');
  static Color gray2 = HexColor('#e8e0e3');
  static const gray = Color(0xffE3E8EE);
  static const blue = Color(0xFF5DCCFC);
  
  static Color getColorBMI(double bmi) {
    if (bmi < 18.5) {
      return const Color(0xFF84CDEE);
    } else if (bmi >= 18.5 && bmi < 25) {
      return AppColors.primary;
    } else if (bmi >= 25 && bmi < 30) {
      return const Color(0xFFFFDF32);
    } else {
      return const Color(0xFFF5554A);
    }
  }
}
