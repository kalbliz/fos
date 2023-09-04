import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
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
          child: Stack(
        children: [
          PageView.builder(
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                controller.currentPage.value = value;
              },
              itemCount: controller.imagePath.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  controller.imagePath[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sizeFit(false, 380, context),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: sizeFit(true, 55, context),
                  vertical: sizeFit(false, 60, context)),
              decoration: const BoxDecoration(
                  color: AppDarkColors.AppPrimaryWhite,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Obx(() {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 8, context)),
                      width: sizeFit(true, 230, context),
                      child: Text(
                        controller.headTexts[controller.currentPage.value],
                        textAlign: TextAlign.center,
                        style: AppTextStyles.TwentyThree700TextBlack,
                      ),
                    ),
                    SizedBox(
                      height: sizeFit(false, 10, context),
                    ),
                    Text(
                      controller.bodyTexts[controller.currentPage.value],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.Sixteen400TextBlack,
                    ),
                    SizedBox(
                      height: sizeFit(false, 30, context),
                    ),
                    SizedBox(
                      child: Obx(() {
                        return controller.currentPage.value != 3
                            ? LinearProgressIndicator(
                                backgroundColor: AppDarkColors.AppAsh,
                                color: AppDarkColors.AppPrimaryPink,
                                value: controller.currentPage.value == 0
                                    ? 0.33
                                    : controller.currentPage.value == 1
                                        ? 0.66
                                        : controller.currentPage.value == 2
                                            ? 1
                                            : 0,
                              )
                            : InkWell(
                                onTap: () {
                                  Get.offAllNamed(Routes.AUTH);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sizeFit(true, 8, context),
                                      vertical: sizeFit(false, 16, context)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: AppDarkColors.AppPrimaryPink)),
                                  child:
                                      Center(child: Text('Let’s order food')),
                                ),
                              );
                      }),
                    )
                  ],
                );
              }),
            ),
          ),
          Obx(() {
            return controller.currentPage.value != 3
                ? Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.pageController.jumpToPage(3);
                        },
                        child: Text(
                          'Skip',
                          style: AppTextStyles.Sixteen400White,
                        ),
                      ),
                    ),
                  )
                : SizedBox();
          })
        ],
      )),
    );
  }
}
