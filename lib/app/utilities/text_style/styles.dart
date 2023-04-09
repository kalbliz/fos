import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle Fourteen400TextAsh = GoogleFonts.poppins(
    color: AppDarkColors.AppTextAsh,
    fontSize: sizeFit(false, 14, Get.context!),
    fontWeight: FontWeight.w400,
  );
  static TextStyle Fourteen400TextPink = GoogleFonts.poppins(
    color: AppDarkColors.AppPrimaryPink,
    fontSize: sizeFit(false, 14, Get.context!),
    fontWeight: FontWeight.w400,
  );
  static TextStyle Fourteen500TextAsh = GoogleFonts.poppins(
    color: AppDarkColors.AppTextAsh,
    fontSize: sizeFit(false, 14, Get.context!),
    fontWeight: FontWeight.w500,
  );
  static TextStyle Sixteen500TextAsh = GoogleFonts.poppins(
    color: AppDarkColors.AppTextAsh,
    fontSize: sizeFit(false, 16, Get.context!),
    fontWeight: FontWeight.w500,
  );
  static TextStyle Sixteen400White = GoogleFonts.poppins(
    color: AppDarkColors.AppPrimaryWhite,
    fontSize: sizeFit(false, 16, Get.context!),
    fontWeight: FontWeight.w400,
  );
  static TextStyle Sixteen400TextBlack = GoogleFonts.poppins(
    color: AppDarkColors.AppTextBlack,
    fontSize: sizeFit(false, 16, Get.context!),
    fontWeight: FontWeight.w400,
  );
  static TextStyle TwentyThree700TextBlack = GoogleFonts.poppins(
      color: AppDarkColors.AppTextBlack,
      fontSize: sizeFit(false, 23, Get.context!),
      fontWeight: FontWeight.w700);
  static TextStyle ThirtyOne500Black = GoogleFonts.poppins(
      color: AppDarkColors.AppPrimaryBlack,
      fontSize: sizeFit(false, 31, Get.context!),
      fontWeight: FontWeight.w500);
  static TextStyle TwentySix400TextWhite = GoogleFonts.poppins(
    color: AppDarkColors.AppPrimaryWhite,
    fontSize: sizeFit(false, 26, Get.context!),
    fontWeight: FontWeight.w400,
  );
  static TextStyle TwentySix400TextPink = GoogleFonts.poppins(
    color: AppDarkColors.AppPrimaryPink,
    fontSize: sizeFit(false, 26, Get.context!),
    fontWeight: FontWeight.w400,
  );
}
