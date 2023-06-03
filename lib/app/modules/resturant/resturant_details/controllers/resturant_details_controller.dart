import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class ResturantDetailsController extends GetxController {
  //TODO: Implement ResturantDetailsController
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final count = 0.obs;
  var resturantName = Get.arguments[0]['resturantName'];
  var resturantIndex = Get.arguments[0]['resturantIndex'];
  final pageViewState = ViewState.idle.obs;
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

  Future getFoodFromResturant() async {
    pageViewState.value = ViewState.busy;
    await foodServices
        .getFoodMenusFromResturant(resturantName: resturantName)
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    pageViewState.value = ViewState.idle;
  }
}
