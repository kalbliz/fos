import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/data/services/orders/order_service.dart';

import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  //TODO: Implement CheckOutController
  final String currency = 'NGN';
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController address = TextEditingController();
  final pageViewState = ViewState.idle.obs;
  final count = 0.obs;
  final AuthService authService = Get.find<AuthService>();
  final CartServices cartService = Get.find<CartServices>();
  final Rx<num> total = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fullname.text = authService.userName;
    email.text = authService.userEmail;
    phone.text = authService.userPhoneNumber;
    address.text = authService.userAddress;
    calculateTotal();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void makeFlutterwavePayment(BuildContext context) async {
    pageViewState.value = ViewState.busy;
    final Customer customer = Customer(
        name: authService.userName,
        phoneNumber: authService.userPhoneNumber,
        email: authService.userEmail);
    Flutterwave flutterwave = Flutterwave(
        //the first 10 fields below are required/mandatory
        context: context,
        customer: customer,
        amount: total.value.toString(),
        //Use your Public and Encription Keys from your Flutterwave account on the dashboard

        publicKey: "FLWPUBK_TEST-e280c645e5fb6a6a4a89935a41ded69e-X",
        currency: currency,
        txRef: DateTime.now().toIso8601String(),
        isTestMode: true,
        customization: Customization(title: "FOS"),
        paymentOptions: 'ussd, card, barter, payattitude',
        redirectUrl:
            'https://thechoicepetshop.com/wc-api/Flw_WC_Payment_Webhook/');
    try {
      await flutterwave.charge().then((response) async {
        debugPrint(response.transactionId);

        if (response.status == null) {
          print("Transaction Failed");
        } else {
          if (response.status == "Transaction successful") {
            print(response.status);
            print(response.transactionId);
          } else if (response.status == 'cancelled') {
            print(response.status);
          } else {
            print(response.status);
          }
        }
        await Get.find<OrderServices>().addOrderDetailToDb2(
            foodMenus: cartService.cartList,
            status: 'success',
            total: total.value);
        await Get.find<OrderServices>().getOrderList();
        await Get.find<CartServices>().deleteCartDetailsFromDb();
        await calculateTotal();
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    pageViewState.value = ViewState.idle;
  }

  calculateTotal() async {
    num sum = 0;
    for (var element in cartService.cartList) {
      sum += element.foodPrice!;
    }
    total.value = sum;
  }
}
