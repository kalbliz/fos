import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/upload/upload.dart';
import 'package:fos/app/modules/user/nav/controllers/nav_controller.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditFoodController extends GetxController {
  //TODO: Implement EditFoodController

  final GlobalKey<FormState> foodFormKey = GlobalKey<FormState>();
  final pageState = ViewState.idle.obs;
  final ImageUploadService imageUploadService = Get.find<ImageUploadService>();
  final count = 0.obs;
  final id = Get.arguments[0]['id'];
  final TextEditingController foodTitleEditingController =
      TextEditingController();
  final TextEditingController foodDescriptionEditingController =
      TextEditingController();
  final TextEditingController foodPriceEditingController =
      TextEditingController();
  final foodTitleValidator = MultiValidator([
    RequiredValidator(errorText: 'title is required'),
  ]);
  final foodDescriptionValidator = MultiValidator([
    RequiredValidator(errorText: 'description is required'),
  ]);
  final foodPriceValidator = MultiValidator([
    RequiredValidator(errorText: 'description is required'),
  ]);
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final Rx<String> file = ''.obs;
  String foodImageUrl = '';
  final ImagePicker picker = ImagePicker();
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final GeneralDialog generalDialog = GeneralDialog();
  late FoodMenus foodMenu;
  @override
  void onInit() {
    super.onInit();
    debugPrint(id);
    foodDescriptionEditingController.text = foodServices.foodFromResturant
        .elementAt(foodServices.foodFromResturant
            .indexWhere((element) => element.id == id))
        .foodDescription!;
    foodPriceEditingController.text = foodServices.foodFromResturant
        .elementAt(foodServices.foodFromResturant
            .indexWhere((element) => element.id == id))
        .foodPrice!
        .toString();
    foodTitleEditingController.text = foodServices.foodFromResturant
        .elementAt(foodServices.foodFromResturant
            .indexWhere((element) => element.id == id))
        .foodName!;
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
      file.value = File(image.path).path;
    }
  }

  Future uploadImage() async {
    await imageUploadService
        .uploadFile(imagePath: file.value, storagePath: 'foods')
        .then((response) {
      foodImageUrl = response;
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

  Future uploadFoodDetails() async {
    pageState.value = ViewState.busy;
    file.value == '' ? null : await uploadImage();

    updateFoodData();
    pageState.value = ViewState.idle;
  }

  Future deleteFood() async {
    pageState.value = ViewState.busy;
    await foodServices.deleteFood(foodId: id).then((value) {
      GeneralDialog().successCupertinoMessage('Food Deleted');
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
    pageState.value = ViewState.idle;
  }

  Future updateFoodData() async {
    pageState.value = ViewState.busy;
    foodMenu = FoodMenus(
        foodName: foodTitleEditingController.value.text.trim(),
        foodDescription: foodDescriptionEditingController.value.text.trim(),
        foodImage: file.value == ''
            ? foodServices.foodFromResturant
                .elementAt(foodServices.foodFromResturant
                    .indexWhere((element) => element.id == id))
                .foodImage
            : foodImageUrl,
        foodPrice: int.tryParse(foodPriceEditingController.value.text.trim()),
        resturantAddress: authService.userAddress,
        resturantName: authService.userName,
        id: id,
        resturantId: authService.userID);
    await foodServices
        .updateFoodData(
            resturantId: foodMenu.resturantId!,
            foodName: foodMenu.foodName!,
            foodDescription: foodMenu.foodDescription!,
            foodImage: foodMenu.foodImage!,
            foodPrice: foodMenu.foodPrice!,
            resturantName: foodMenu.resturantName!,
            resturantAddress: foodMenu.resturantAddress!,
            foodId: foodMenu.id)
        .then((value) {
      foodServices.getFoodMenusFromResturant(
          resturantName: authService.userName);
      generalDialog
          .foodUploadSuccessCupertinoMessage('Your food has been saved ');
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
    pageState.value = ViewState.idle;
  }
}
