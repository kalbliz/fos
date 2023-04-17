import 'package:flutter/material.dart';
import 'package:fos/app/modules/auth/controllers/login_controller.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    FobTextFieldWidget(
                      hintText: 'Enter your email',
                      textEditingController: controller.emailEditingController,
                      validator: controller.emailValidator,
                    ),
                    SizedBox(
                      height: sizeFit(false, 16, context),
                    ),
                    FobTextFieldWidget(
                      hintText: 'Password',
                      textEditingController: controller.emailEditingController,
                      validator: controller.passwordValidator,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeFit(false, 8, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.Fourteen400TextPink,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeFit(false, 32, context),
              ),
              AuthButton(
                  title: 'Sign In',
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (controller.loginFormKey.currentState!.validate()) {}
                  }),
              SizedBox(
                height: sizeFit(false, 24, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: AppTextStyles.Fourteen400TextAsh,
                  ),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.offAllNamed(Routes.SIGN_UP);
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.Fourteen400TextPink,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
