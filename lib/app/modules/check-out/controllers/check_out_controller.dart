import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/view/flutterwave_style.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';

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
  final pageViewState = ViewState.idle.obs;
  final count = 0.obs;
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

  void makeFlutterwavePayment(BuildContext context) async {
    pageViewState.value = ViewState.busy;
    final Customer customer = Customer(
        name: authService.userName,
        phoneNumber: authService.userPhoneNumber,
        email: authService.userEmail);
    try {
      Flutterwave flutterwave = Flutterwave(
          //the first 10 fields below are required/mandatory
          context: context,
          customer: customer,
          amount: amount.value.text,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard

          publicKey: "FLWPUBK_TEST-e280c645e5fb6a6a4a89935a41ded69e-X",
          currency: currency,
          txRef: DateTime.now().toIso8601String(),
          isTestMode: true,
          customization: Customization(title: "My Payment"),
          paymentOptions: 'ussd, card, barter, payattitude',
          redirectUrl:
              'https://thechoicepetshop.com/wc-api/Flw_WC_Payment_Webhook/');

      await flutterwave.charge().then((response) {
        debugPrint(response.transactionId);

        if (response.status == null) {
          print("Transaction Failed");
        } else {
          if (response.status == "Transaction successful") {
          
            print(response.status);
            print(response.transactionId);

            Get.back();
          } else if (response.status == 'cancelled') {
            Get.back();
            print(response.status);
          } else {
            print(response.status);
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    pageViewState.value = ViewState.idle;
  }
}
