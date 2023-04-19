import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
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
  String sellerImageUrl = '';
  final ImagePicker picker = ImagePicker();
  Position? position;
  List<Placemark>? placemarks;
  final AuthService authService = Get.find<AuthService>();
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

  Future locationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    getUserLocation();
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

  Future registerUser(User currentUser) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child('sellers')
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(File(file.value));
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((url) {
      sellerImageUrl = url;
      saveDatatToFirestore(currentUser);
    });
  }

  Future saveDatatToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection('sellers').doc(currentUser.uid).set({
      'userID': currentUser.uid,
      'userEmail': currentUser.email,
      'userName': nameEditingController.value.text.trim(),
      'userPhoto': sellerImageUrl,
      'userPhoneNumber': phoneNumberEditingController.value.text.trim(),
      'userAddress': locationEditingController.value.text.trim(),
      'status': 'approved',
      'earnings': 0.0,
      'lat': position!.latitude,
      'lng': position!.longitude
    });
    // authService.userEmail = currentUser.email!;
    // authService.userName = nameEditingController.value.text.trim();
    // authService.userPhoneNumber =
    //     phoneNumberEditingController.value.text.trim();
    // authService.userPhoto = sellerImageUrl;
  }

  void authenticateAndSignUp() async {
    pageState.value = ViewState.busy;
    User? currentUser;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailEditingController.value.text.trim(),
            password: passwordEditingController.value.text.trim())
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      pageState.value = ViewState.idle;
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      await registerUser(currentUser!).then((value) {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
    pageState.value = ViewState.idle;
  }
}
