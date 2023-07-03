import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class AssignRiderController extends GetxController {
  //TODO: Implement AssignRiderController

  final count = 0.obs;
  final foodService = Get.find<FoodServices>();
  final riderServices = Get.find<RiderServices>();
  final indexInUse = Get.find<FoodServices>().index;
  final profileImageUrl = ''.obs;

  final _authService = Get.find<AuthService>();
  final TextEditingController searchEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<RiderData> riderListFromAPI = <RiderData>[].obs;
  final ScrollController scrollController = ScrollController();
  final ScrollPhysics scrollPhysics = BouncingScrollPhysics();
  final GlobalKey<FormState> createRider = GlobalKey<FormState>();

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

  final addNewRiderViewState = ViewState.idle.obs;
  final GeneralDialog _dialog = GeneralDialog();

  @override
  void onInit() {
    super.onInit();
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
  Future assignRider({required int index}) async {
    addNewRiderViewState.value = ViewState.busy;
    RiderData riderData = RiderData(
      name: riderServices.riders.elementAt(index).name,
      id: riderServices.riders.elementAt(index).id,
      phone: riderServices.riders.elementAt(index).phone,
      photo: riderServices.riders.elementAt(index).photo,
      email: riderServices.riders.elementAt(index).email,
      active: riderServices.riders.elementAt(index).active,
      address: riderServices.riders.elementAt(index).address,
      createdAt: riderServices.riders.elementAt(index).createdAt,
      updatedAt: riderServices.riders.elementAt(index).updatedAt,
    );
    foodService.ordersListInUse.elementAt(foodService.index).status = 'pending';
    await foodService
        .updateOrderRider(
            orderModel:
                foodService.ordersListInUse.elementAt(foodService.index),
            rider: riderData)
        .then((value) {
      Get.until((route) => route.settings.name == Routes.RESTURANT_NAV);
      Get.find<ResturantHomeController>().getresturantOrders();
      _dialog.successCupertinoMessage(
        'Order has been assigned to a rider',
      );
    }).catchError((onError) {
      print(onError);
      _dialog.errorMessage(onError.toString());
    });
    addNewRiderViewState.value = ViewState.idle;
  }
}
