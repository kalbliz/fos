import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/modules/rider/rider_profile/controllers/rider_profile_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class ResturantProfileController extends GetxController {
  //TODO: Implement ResturantProfileController
  final AuthService authService = Get.find<AuthService>();
  final OrderServices orderService = Get.find<OrderServices>();
  final foodService = Get.find<FoodServices>();
   final thisViewState = ViewState.idle.obs;
  final count = 0.obs;
  final List<ProfileMenuModel> menuList = [
    ProfileMenuModel(
        imagePath: 'assets/images/nav/personal_details.png',
        title: 'Profile Details',
        onTap: () {}),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/settings.png',
        title: 'Settings',
        onTap: () {}),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/rate_app.png',
        title: 'Rate the app',
        onTap: () {}),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/logout_red.png',
        title: 'Log out',
        onTap: () {
          Get.offAllNamed(Routes.LOGIN);
        }),
  ];
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
