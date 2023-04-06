import 'package:get/get.dart';

import 'package:fos/app/modules/auth/controllers/login_controller.dart';
import 'package:fos/app/modules/auth/controllers/sign_up_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
