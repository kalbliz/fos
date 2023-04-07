import 'package:flutter/material.dart';
import 'package:fos/app/modules/auth/controllers/login_controller.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: sizeFit(true, 38, context),
              right: sizeFit(true, 38, context),
              top: sizeFit(false, 70, context)),
          child: Column(children: [
            Image.asset(
              'assets/images/onboard/login_imgae.png',
              height: sizeFit(false, 300, context),
            ),
            SizedBox(
              height: sizeFit(false, 22, context),
            ),
            FobTextFieldWidget(hintText: 'Enter your email')
          ]),
        ),
      ),
    );
  }
}
