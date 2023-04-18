
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
              apiKey: 'AIzaSyA80JwT6DDlGN9UuLoZpXJYChZUAuGufy4',
              appId: '1:197822104172:android:21633aa74d26978a6b4e49',
              messagingSenderId: '197822104172',
              projectId: 'fos-app-7d3a7',
              storageBucket: 'fos-app-7d3a7.appspot.com',
            )
        );
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
