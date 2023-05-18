import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class ResturantOrdersController extends GetxController {
  //TODO: Implement ResturantOrdersController
  final foodServices = Get.find<FoodServices>();
  final authServices = Get.find<AuthService>();
  final pageViewState = ViewState.idle.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getOurMenu();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  Future getOurMenu() async {
    pageViewState.value = ViewState.busy;
    await foodServices.getFoodMenusFromResturant(
        resturantName: authServices.userName);
    pageViewState.value = ViewState.idle;
  }
}
