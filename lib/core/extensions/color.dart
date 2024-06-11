import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CustomShadow {
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: AppColors.gray.withOpacity(.2),
          blurRadius: 2,
          spreadRadius: .7,
          offset: const Offset(0, 1),
        ),
      ];
}
