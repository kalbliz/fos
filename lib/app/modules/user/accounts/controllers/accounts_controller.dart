import 'package:firebase_auth/firebase_auth.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/modules/rider/rider_profile/controllers/rider_profile_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/global/aut_status.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController {
  //TODO: Implement AccountsController
  final AuthService authService = Get.find<AuthService>();
  final OrderServices orderService = Get.find<OrderServices>();
  final count = 0.obs;
  final thisViewState = ViewState.idle.obs;
  final List<ProfileMenuModel> menuList = [
    ProfileMenuModel(
        imagePath: 'assets/images/nav/personal_details.png',
        title: 'Profile Details',
        onTap: () {
          // Get.toNamed(Routes.RIDER_PERSONAL_DETAILS);
        }),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/settings.png',
        title: 'Settings',
        onTap: () {
          // Get.toNamed(Routes.RIDER_SETTINGS);
        }),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/rate_app.png',
        title: 'Rate the app',
        onTap: () {}),
    ProfileMenuModel(
        imagePath: 'assets/images/nav/logout_red.png',
        title: 'Log out',
        onTap: () {}),
  ];
  final pageState = ViewState.idle.obs;

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

  Future logOut() async {
    pageState.value = ViewState.busy;

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((auth) {
      Get.offAllNamed(Routes.LOGIN);
    }).catchError((error) {
      var message = AuthExceptionHandler.handleAuthException(error);

      var messageBug = AuthExceptionHandler.generateErrorMessage(message);

      GeneralDialog().errorMessage(messageBug);
    });

    pageState.value = ViewState.idle;
  }
}
