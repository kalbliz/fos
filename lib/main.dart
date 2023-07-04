import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/data/services/upload/upload.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

Future<void> initServices() async {
  Get.log('starting services ...');

  await GetStorage.init();
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.putAsync<ImageUploadService>(() async => ImageUploadService());
  await Get.putAsync<FoodServices>(() async => FoodServices());
  await Get.putAsync<OrderServices>(() async => OrderServices());
  await Get.putAsync<CartServices>(() async => CartServices());
  await Get.putAsync<RiderServices>(() async => RiderServices());
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA80JwT6DDlGN9UuLoZpXJYChZUAuGufy4',
    appId: '1:197822104172:android:21633aa74d26978a6b4e49',
    messagingSenderId: '197822104172',
    projectId: 'fos-app-7d3a7',
    storageBucket: 'fos-app-7d3a7.appspot.com',
  ));
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await initServices();
  final authServices = Get.find<AuthService>();
  runApp(
    GetMaterialApp(
      title: "FOS",
      // initialRoute: AppPages.INITIAL,
      initialRoute: await authServices.initialRoute(),
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
