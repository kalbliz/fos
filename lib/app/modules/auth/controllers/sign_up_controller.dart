import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart ';

import '../../../utilities/enums/view_state.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final pageState = ViewState.idle.obs;
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController(text: '');
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  Rx<TextEditingController> locationEditingController =
      TextEditingController(text: '').obs;

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: 'invalid email'),
  ]);
  final locationValidator = MultiValidator([
    RequiredValidator(errorText: 'location is required'),
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    LengthRangeValidator(
        min: 8,
        max: 24,
        errorText: 'passwrod must be between 8 and 24 characters')
  ]);
  final phoneNumberValidator = MultiValidator([
    RequiredValidator(errorText: 'phone number is required'),
    LengthRangeValidator(min: 11, max: 14, errorText: 'invalid phone number')
  ]);
  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
  ]);
  final dropdownvalue = 'Select User Description'.obs;
  final List<String> dropdownMenuList = [
    'Resturant',
    'Rider',
    'User',
    'Select User Description'
  ];
  final count = 0.obs;

  final Rx<String> file = ''.obs;
  final ImagePicker picker = ImagePicker();
  Position? position;
  List<Placemark>? placemarks;
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
      file.value = File(image.path).path;
    }
  }

  Future getUserLocation() async {
    pageState.value = ViewState.busy;
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = newPosition;
    placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placemarks![0];
    String completeAddress =
        '${pMark.subThoroughfare!} ${pMark.thoroughfare!}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country} ';
    locationEditingController.value.text = completeAddress;
    debugPrint(completeAddress);
    pageState.value = ViewState.idle;
  }
}
