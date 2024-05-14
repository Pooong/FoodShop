import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSpanWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final double size;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final Color textColor2;
  const TextSpanWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.size = 16.0,
    this.fontWeight2 = FontWeight.normal,
    this.fontWeight1 = FontWeight.normal,
    this.textColor2 = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: size,
            overflow: TextOverflow.ellipsis,
            color: AppColors.black,
          ),
        ),
        children: [
          TextSpan(
            text: text1.tr,
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                  fontSize: size,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: fontWeight1),
            ),
          ),
          const TextSpan(text: " "),
          TextSpan(
            text: text2.tr,
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                fontSize: size,
                overflow: TextOverflow.ellipsis,
                fontWeight: fontWeight2,
                color: textColor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
