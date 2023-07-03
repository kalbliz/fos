import 'package:flutter/material.dart';
import 'package:fos/app/modules/global/auth/controllers/login_controller.dart';
import 'package:fos/app/modules/global/auth/views/auth_view.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
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
        child: Obx(() {
          return controller.pageViewState.value == ViewState.busy
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
                            FosTextFieldWidget(
                              hintText: 'Enter your email',
                              textEditingController:
                                  controller.emailEditingController,
                              validator: controller.emailValidator,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            Obx(() {
                              return FosTextFieldWidget(
                                hintText: 'Password',
                                textEditingController:
                                    controller.passwordEditingController,
                                validator: controller.passwordValidator,
                                maxLines: 1,
                                obscureText: controller.obscureText.value,
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 8, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Show',
                                style: TextStyle(
                                    color: AppDarkColors.AppPrimaryPink,
                                    fontSize: sizeFit(false, 12, context)),
                              ),
                              SizedBox(
                                width: sizeFit(true, 8, context),
                              ),
                              Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.obscureText.value =
                                        !controller.obscureText.value;
                                  },
                                  child: controller.obscureText.value == false
                                      ? Icon(
                                          Icons.check_box,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                );
                              }),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              controller.resetPassword();
                            },
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
                            if (controller.loginFormKey.currentState!
                                .validate()) {
                              controller.loginUser();
                            }
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
                );
        }),
      ),
    );
  }
}
