// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          top: sizeFit(false, 40, context),
          left: sizeFit(true, 31, context),
          right: sizeFit(true, 31, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/onboard/auth_image.png',
                height: sizeFit(false, 300, context),
              ),
            ),
            SizedBox(
              height: sizeFit(false, 40, context),
            ),
            SizedBox(
              width: sizeFit(true, 270, context),
              child: Text(
                'Thinking About what to eat?',
                style: AppTextStyles.ThirtyOne500Black,
              ),
            ),
            SizedBox(
              height: sizeFit(false, 24, context),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus interdum.Faucibus interdum.',
              style: AppTextStyles.Sixteen500TextAsh,
            ),
            SizedBox(
              height: sizeFit(false, 74, context),
            ),
            Center(
              child: AuthButton(
                title: 'Log In',
                onTap: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),
            ),
            SizedBox(
              height: sizeFit(false, 16, context),
            ),
            Center(
              child: AuthButton(
                title: 'Sign Up',
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const AuthButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeFit(false, 48, context),
        width: sizeFit(true, 206, context),
        decoration: BoxDecoration(
            color: AppDarkColors.AppPrimaryPink,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.Sixteen400White,
          ),
        ),
      ),
    );
  }
}
