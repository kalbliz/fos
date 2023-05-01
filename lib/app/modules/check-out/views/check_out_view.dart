import 'package:flutter/material.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Out'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeFit(true, 16, context),
                  vertical: sizeFit(false, 24, context)),
              child: Column(
                children: [
                  FosTextFieldWidget(
                    hintText: 'Full name',
                    textEditingController: controller.fullname,
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Please fill in Your Name",
                  ),
                  SizedBox(
                    height: sizeFit(false, 16, context),
                  ),
                  FosTextFieldWidget(
                    hintText: 'email',
                    textEditingController: controller.email,
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Please fill in Email",
                  ),
                  SizedBox(
                    height: sizeFit(false, 16, context),
                  ),
                  FosTextFieldWidget(
                    hintText: 'phone',
                    textEditingController: controller.phone,
                    validator: (value) => value!.isNotEmpty
                        ? null
                        : "Please fill in Your phone number",
                  ),
                  SizedBox(
                    height: sizeFit(false, 16, context),
                  ),
                  FosTextFieldWidget(
                    hintText: 'amount',
                    textEditingController: controller.amount,
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Please fill in amount",
                  ),
                  SizedBox(
                    height: sizeFit(false, 16, context),
                  ),
                  AuthButton(
                    onTap: () {
                      controller.makeFlutterwavePayment(context);
                    },
                    title: 'Make Payment',
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
