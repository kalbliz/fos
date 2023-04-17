import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fos/app/modules/auth/controllers/sign_up_controller.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Obx(() {
          return controller.pageState.value == ViewState.busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: sizeFit(true, 38, context),
                        right: sizeFit(true, 38, context),
                        top: sizeFit(false, 70, context)),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/onboard/signup_image.png',
                        height: sizeFit(false, 300, context),
                      ),
                      SizedBox(
                        height: sizeFit(false, 22, context),
                      ),
                      Form(
                        key: controller.signUpFormKey,
                        child: Column(
                          children: [
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  controller.getImage();
                                },
                                child: CircleAvatar(
                                  radius: sizeFit(false, 50, context),
                                  backgroundColor: AppDarkColors.AppPrimaryPink,
                                  backgroundImage: controller.file.value == ''
                                      ? null
                                      : FileImage(File(controller.file.value)),
                                  child: controller.file.value == ''
                                      ? Icon(
                                          Icons.add_photo_alternate,
                                          size: sizeFit(false, 30, context),
                                          color: AppDarkColors.AppPrimaryWhite,
                                        )
                                      : null,
                                ),
                              );
                            }),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FobTextFieldWidget(
                                hintText: 'Enter your name',
                                textEditingController:
                                    controller.nameEditingController,
                                validator: controller.nameValidator,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FobTextFieldWidget(
                                hintText: 'Enter your email',
                                textEditingController:
                                    controller.emailEditingController,
                                validator: controller.emailValidator,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FobTextFieldWidget(
                                hintText: 'Create Password',
                                textEditingController:
                                    controller.passwordEditingController,
                                validator: controller.passwordValidator,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FobTextFieldWidget(
                                hintText: 'Enter phone number',
                                textEditingController:
                                    controller.passwordEditingController,
                                validator: controller.passwordValidator,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: Obx(() {
                                return FobTextFieldWidget(
                                  hintText: 'Resturant location',
                                  enabled: false,
                                  textEditingController: controller
                                      .locationEditingController.value,
                                  validator: controller.locationValidator,
                                );
                              }),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            AuthButton(
                                title: 'Get current location',
                                boxColror: AppDarkColors.AppYellow,
                                onTap: () {
                                  controller.getUserLocation();
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 32, context),
                      ),
                      AuthButton(
                          title: 'Sign Up',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (controller.signUpFormKey.currentState!
                                .validate()) {}
                          }),
                      SizedBox(
                        height: sizeFit(false, 24, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: AppTextStyles.Fourteen400TextAsh,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text(
                              'Login',
                              style: AppTextStyles.Fourteen400TextPink,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                );
        }),
      ),
    );
  }
}
