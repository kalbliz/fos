import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: 'invalid email'),
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
  ]);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final AuthService authService = Get.find<AuthService>();
   final RiderServices riderServices = Get.find<RiderServices>();
  final pageViewState = ViewState.idle.obs;
  final count = 0.obs;
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

  Future loginUser() async {
    pageViewState.value = ViewState.busy;

    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailEditingController.value.text.trim(),
            password: passwordEditingController.value.text.trim())
        .then((response) async {
      await readUserDetails(response.user!);
      debugPrint(authService.box.read('userState'));
      if (authService.box.read('userState') == 'user') {
        Get.offAllNamed(Routes.NAV);
      } else if (authService.box.read('userState') == 'resturant') {
        Get.offAllNamed(Routes.RESTURANT_NAV);
      } else {

        Get.offAllNamed(Routes.RIDER_NAV);
      }
    }).catchError((onError) {
      pageViewState.value = ViewState.idle;
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(message: onError.toString());
          });

      debugPrint(onError.toString());
    });

    pageViewState.value = ViewState.idle;
  }

  Future readUserDetails(User currentUser) async {
    await firebaseFirestore
        .collection('allUsers')
        .doc(currentUser.uid)
        .get()
        .then((response) {
      authService.box.write('userState', response.data()!['userState']);
      authService.userID = currentUser.uid;   
      authService.userEmail = response.data()!['userEmail'];
      authService.userName = response.data()!['userName'];
      authService.userPhoto = response.data()!['userPhoto'];
      authService.userPhoneNumber = response.data()!['userPhoneNumber'];
      authService.userAddress = response.data()!['userAddress'];
      authService.status = response.data()!['userStatus'];
      authService.earnings = response.data()!['earnings'];
      authService.userState = response.data()!['userState'];
    }).catchError((onError) {
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(message: onError.toString());
          });
    });
  }
}
