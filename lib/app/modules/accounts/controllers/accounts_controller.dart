import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController {
  //TODO: Implement AccountsController
  final AuthService authService = Get.find<AuthService>();
   final OrderServices orderService = Get.find<OrderServices>();
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
