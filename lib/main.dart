import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          navigationBarTheme: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStatePropertyAll(GoogleFonts.poppins(
                color: AppDarkColors.AppPrimaryPink,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
              iconTheme: MaterialStateProperty.all(
                const IconThemeData(
                  color: Colors.transparent,
                ),
              ))),
    ),
  );
}
