import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class RiderProfileController extends GetxController {
  //TODO: Implement RiderProfileController
  final buttonViewState = ViewState.idle.obs;
  final thisViewState = ViewState.idle.obs;
  final count = 0.obs;
  late FirebaseFirestore firebaseFireStore;
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
        onTap: () {
          Get.offAllNamed(Routes.LOGIN);
        }),
  ];
  final AuthService authService = Get.find<AuthService>();
  final RiderServices riderServices = Get.find<RiderServices>();
  final GeneralDialog generalDialog = GeneralDialog();
  late RiderData riderDetails;
  @override
  void onInit() {
    super.onInit();
    riderDetails = RiderData();
    getRiderDetails();
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
  Future getRiderDetails() async {
    thisViewState.value = ViewState.busy;
    firebaseFireStore = FirebaseFirestore.instance;

    await riderServices.getAllRiders().then((value) {
      riderDetails = riderServices.riders
          .firstWhere((element) => element.name == authService.userName);
    }).catchError((onError) {
      generalDialog.errorMessage(onError.toString());
      throw onError;
    });
    thisViewState.value = ViewState.idle;
  }
}

class ProfileMenuModel {
  final String imagePath;
  final String title;
  final void Function() onTap;
  ProfileMenuModel({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });
}
