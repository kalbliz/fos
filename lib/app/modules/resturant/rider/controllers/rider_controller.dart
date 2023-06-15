import 'package:flutter/material.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class RiderController extends GetxController {
  //TODO: Implement RiderController
  final _riderService = Get.find<RiderServices>();
  final count = 0.obs;
   RxList<RiderData> ridersList = <RiderData>[].obs;
     final riderViewState = ViewState.idle.obs;
       final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
  void selectRider(int index) {
    _riderService.selectedRiderIndex = index;
  }
}
