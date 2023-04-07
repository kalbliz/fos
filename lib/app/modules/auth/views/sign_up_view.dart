import 'package:flutter/material.dart';
import 'package:fos/app/modules/auth/controllers/sign_up_controller.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
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
        child: SingleChildScrollView(
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
                    Obx(() {
                      return Container(
                        width: sizeFit(true, 300, context),
                        padding: EdgeInsets.zero,
                        child: DropdownButtonFormField(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: sizeFit(false, 20, context),
                              color: AppDarkColors.AppPrimaryPink,
                            ),
                            style: GoogleFonts.poppins(
                                color: AppDarkColors.AppPrimaryBlack,
                                fontSize: sizeFit(false, 16, context),
                                fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(),
                                errorBorder: UnderlineInputBorder()),
                            value: controller.dropdownvalue.value,
                            isExpanded: true,
                            validator: (value) =>
                                value == 'Select User Description'
                                    ? 'required'
                                    : null,
                            items:
                                controller.dropdownMenuList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: sizeFit(true, 16, context),
                                  ),
                                  child: (Text(
                                    items,
                                    style: items == 'Select User Description'
                                        ? AppTextStyles.Fourteen400TextAsh
                                        : AppTextStyles.Sixteen400TextBlack,
                                  )),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              controller.dropdownvalue.value =
                                  newValue.toString();
                            }),
                      );
                    }),
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
                    if (controller.signUpFormKey.currentState!.validate()) {}
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
        ),
      ),
    );
  }
}
