import 'package:flutter/material.dart';
import 'package:fos/app/modules/rider/rider_history/views/rider_history_view.dart';
import 'package:fos/app/modules/rider/rider_home/controllers/rider_home_controller.dart';
import 'package:fos/app/modules/rider/rider_home/views/rider_home_view.dart';
import 'package:fos/app/modules/rider/rider_profile/views/rider_profile_view.dart';
import 'package:fos/app/modules/rider/rider_support/views/rider_support_view.dart';
import 'package:fos/app/utilities/global/keep_alive.dart';
import 'package:get/get.dart';

class RiderNavController extends GetxController {
  //TODO: Implement RiderNavController

  final homeContoller = Get.find<RiderHomeController>();
  final count = 0.obs;
  var tabIndex = 0.obs;
  var pages = <Widget>[].obs;
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
      pageController =
        PageController(initialPage: tabIndex.value, keepPage: false);
    pages.add(
      const KeepAliveWrapper(
        child: RiderHomeView(),
      ),
    );
    pages.add(RiderSupportView());
    pages.add(const RiderHistoryView());
    pages.add(const RiderProfileView());
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
   void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
    Get.log(tabIndex.value.toString());
    update();
  }

  void onPageChanged(int value) {
    tabIndex.value = value;
    // pageController.jumpToPage(value);
  }
}
