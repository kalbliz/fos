import 'package:get/get.dart';

import '../controllers/edit_food_controller.dart';

class EditFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditFoodController>(
      () => EditFoodController(),
    );
  }
}
