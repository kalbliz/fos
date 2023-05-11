import 'package:get/get.dart';

class ResturantHomeController extends GetxController {
  //TODO: Implement ResturantHomeController
  var id = Get.arguments[0]['id'];
  final count = 0.obs;
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
