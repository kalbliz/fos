import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:get/get.dart';

class ResturantDetailsController extends GetxController {
  //TODO: Implement ResturantDetailsController
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final count = 0.obs;
  var index = Get.arguments[0]['index'];
  @override
  void onInit() {
    super.onInit();
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
