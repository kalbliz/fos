import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/data/services/upload/upload.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRiderController extends GetxController {
  //TODO: Implement CreateRiderController
  final foodService = Get.find<FoodServices>();
  final riderServices = Get.find<RiderServices>();

  final ImageUploadService imageUploadService = Get.find<ImageUploadService>();
  final _authService = Get.find<AuthService>();
  final GlobalKey<FormState> createRider = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid email')
  ]);

  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Name is required'),
    LengthRangeValidator(
        min: 3, max: 24, errorText: 'Name must be up to 3 characters')
  ]);

  final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Phone number is required'),
    LengthRangeValidator(min: 11, max: 11, errorText: 'Invalid phone number')
  ]);

  final senderAddressValidator = MultiValidator([
    RequiredValidator(errorText: 'Address is required'),
  ]);
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final Rx<String> file = ''.obs;
  String foodImageUrl = '';
  final ImagePicker picker = ImagePicker();
  final pageState = ViewState.idle.obs;

  final addNewRiderViewState = ViewState.idle.obs;
  final GeneralDialog _dialog = GeneralDialog();
  final count = 0.obs;
  late RiderData riderData;
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

  Future getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      debugPrint(image.toString());
      file.value = File(image.path).path;
    }
  }

  Future uploadImage() async {
    await imageUploadService
        .uploadFile(imagePath: file.value, storagePath: 'riders')
        .then((response) {
      foodImageUrl = response;
    });
  }

  Future uploadFoodDetails() async {
    pageState.value = ViewState.busy;
    await uploadImage();
    debugPrint(foodImageUrl);
    await authenticateAndSignUp();

    pageState.value = ViewState.idle;
  }

  Future authenticateAndSignUp() async {
    User? currentUser;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailEditingController.value.text, password: 'password')
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      await saveDatatToFirestore(currentUser!)
          .then((value) async => await saveRider().then((value) {}));
    }
  }

  Future saveDatatToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("allUsers").doc(currentUser.uid).set({
      'userID': currentUser.uid,
      'userEmail': currentUser.email,
      'userName': nameEditingController.value.text.trim(),
      'userPhoto': foodImageUrl,
      'userPhoneNumber': phoneEditingController.value.text.trim(),
      'userAddress': addressEditingController.value.text.trim(),
      'status': 'approved',
      'userState': "rider",
      'earnings': 0.0,
      'lat': 0,
      'lng': 0
    });
  }

  Future saveRider() async {
    riderData = RiderData(
        name: nameEditingController.value.text,
        photo: foodImageUrl,
        email: emailEditingController.value.text,
        phone: phoneEditingController.value.text,
        active: 1,
        address: addressEditingController.value.text,
        createdAt: DateTime.now().toIso8601String(),
        creator: Get.find<AuthService>().userName);

    await riderServices.saveRider(riderData).then((value) async {
      await riderServices.getAllRiders();
      Get.until((route) => route.settings.name == Routes.RESTURANT_NAV);
      _dialog.successCupertinoMessage('you have successfully created rider');
    }).catchError((onError) {
      debugPrint(onError.toString());
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(
              message: onError.toString(),
            );
          });
    });
  }
}
