import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class RiderSupportController extends GetxController {
  //TODO: Implement RiderSupportController
final AuthService authService = Get.find<AuthService>();
  final pageViewState = ViewState.idle.obs;
  late GeneralDialog _dialog;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _dialog = GeneralDialog();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
