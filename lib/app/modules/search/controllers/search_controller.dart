import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/upload/upload.dart';
import 'package:fos/app/modules/nav/controllers/nav_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart%20';

class SearchController extends GetxController {
  //TODO: Implement SearchController
  final GlobalKey<FormState> foodFormKey = GlobalKey<FormState>();
  final pageState = ViewState.idle.obs;
  final ImageUploadService imageUploadService = Get.find<ImageUploadService>();
  final index = 0.obs;
  final TextEditingController searchTextEditingController =
      TextEditingController();
  final searchValidator = MultiValidator([
    RequiredValidator(errorText: 'title is required'),
  ]);
  final RxList<FoodMenus> searchMenu = <FoodMenus>[].obs;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final ImagePicker picker = ImagePicker();
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final GeneralDialog generalDialog = GeneralDialog();
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
 

  Future searchFood() async {
    pageState.value = ViewState.busy;
    searchMenu.value = foodServices.foodMenus
        .where((item) => item.foodName!
            .toLowerCase()
            .contains(searchTextEditingController.value.text.toLowerCase()))
        .toList();
        
    pageState.value = ViewState.idle;
  }
  // Future saveFoodData() async {
  //   await fireStore.collection('foodMenus').doc().set({
  //     'foodName': searchEditingController.value.text.trim(),
  //     'foodDescription': foodDescriptionEditingController.value.text.trim(),
  //     'foodImage': foodImageUrl,
  //     'foodPrice': int.tryParse(foodPriceEditingController.value.text.trim()),
  //     'sellerName': authService.userName
  //   }).then((value) async {
  //     await foodServices.getFoodMenus();
  //     generalDialog
  //         .foodUploadSuccessCupertinoMessage('Your food has been saved ');
  //   }).catchError((onError) {
  //     debugPrint(onError.toString());
  //     showDialog(
  //         context: Get.context!,
  //         builder: (builder) {
  //           return ErrorDialog(
  //             message: onError.toString(),
  //           );
  //         });
  //   });
  // }
}
