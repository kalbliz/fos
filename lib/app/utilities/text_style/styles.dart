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
}
