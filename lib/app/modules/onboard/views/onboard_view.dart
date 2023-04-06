import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      'assets/images/onboard/onboard_two.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: sizeFit(false, 344, context),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 45, context),
                            vertical: sizeFit(false, 60, context)),
                        decoration: BoxDecoration(
                            color: AppDarkColors.AppPrimaryWhite,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text(
                                'Order whatever you \nwant to eat ',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.TwentyThree700TextBlack,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 10, context),
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a elementum sit eu quam vulputate ultricies a.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.Sixteen400TextBlack,
                            ),
                            SizedBox(
                              height: sizeFit(false, 10, context),
                            ),
                            LinearProgressIndicator(
                              backgroundColor: AppDarkColors.AppAsh,
                              color: AppDarkColors.AppPrimaryPink,
                              value: 1,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              })),
    );
  }
}
