import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fos/app/modules/auth/controllers/sign_up_controller.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/user_type.dart';
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
                        height: sizeFit(false, 250, context),
                      ),
                      Form(
                        key: controller.signUpFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: CircleAvatar(
                                    radius: sizeFit(false, 50, context),
                                    backgroundColor:
                                        AppDarkColors.AppPrimaryPink,
                                    backgroundImage: controller.file.value == ''
                                        ? null
                                        : FileImage(
                                            File(controller.file.value)),
                                    child: controller.file.value == ''
                                        ? Icon(
                                            Icons.add_photo_alternate,
                                            size: sizeFit(false, 30, context),
                                            color:
                                                AppDarkColors.AppPrimaryWhite,
                                          )
                                        : null,
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FosTextFieldWidget(
                                hintText: 'Enter your name',
                                textEditingController:
                                    controller.nameEditingController,
                                validator: controller.nameValidator,
                                textInputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FosTextFieldWidget(
                                hintText: 'Enter your email',
                                textEditingController:
                                    controller.emailEditingController,
                                validator: controller.emailValidator,
                                textInputType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FosTextFieldWidget(
                                hintText: 'Create Password',
                                textEditingController:
                                    controller.passwordEditingController,
                                validator: controller.passwordValidator,
                                textInputType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: FosTextFieldWidget(
                                hintText: 'Enter phone number',
                                textEditingController:
                                    controller.phoneNumberEditingController,
                                validator: controller.phoneNumberValidator,
                                textInputType: TextInputType.phone,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            SizedBox(
                              width: sizeFit(true, 300, context),
                              child: Obx(() {
                                return FosTextFieldWidget(
                                  hintText: 'Your location',
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
                            Center(
                              child: AuthButton(
                                  title: 'Get current location',
                                  boxColror: AppDarkColors.AppYellow,
                                  onTap: () {
                                    controller.locationPermission();
                                  }),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            Text('What do you want to register as?'),
                            Obx(() {
                              return RadioListTile<UserState>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const Text('User'),
                                value: UserState.user,
                                groupValue: controller.userState.value,
                                onChanged: (UserState? value) {
                                  controller.userState.value = value!;
                                  debugPrint(
                                      controller.userState.value.toString());
                                },
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                              );
                            }),
                            Obx(() {
                              return RadioListTile<UserState>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const Text('Resturant'),
                                value: UserState.resturant,
                                groupValue: controller.userState.value,
                                onChanged: (UserState? value) {
                                  controller.userState.value = value!;
                                },
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                              );
                            }),
                            Obx(() {
                              return RadioListTile<UserState>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const Text('Rider'),
                                value: UserState.rider,
                                groupValue: controller.userState.value,
                                onChanged: (UserState? value) {
                                  controller.userState.value = value!;
                                },
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                              );
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
                                    .validate() &&
                                controller.file.value != '') {
                              controller.authenticateAndSignUp();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ErrorDialog(
                                        message: 'Invalid image');
                                  });
                            }
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
