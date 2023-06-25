import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/tens.dart';

import 'package:get/get.dart';

import '../controllers/rider_nav_controller.dart';

class RiderNavView extends GetView<RiderNavController> {
  const RiderNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      // Obx(
      //   () => controller.pages[controller.tabIndex.value],
      // ),
      bottomNavigationBar: Obx(
        () => Offstage(
          offstage: controller.homeContoller.isShimmerLoading.value,
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: AppColors.AppBackgroundWhite,
            height: sizeFit(false, 70, context),
            surfaceTintColor: AppColors.AppBackgroundWhite,
            shadowColor: AppColors.AppAsh,
            elevation: 10,
            selectedIndex: controller.tabIndex.value,
            onDestinationSelected: (index) {
              controller.changeTabIndex(index);
            },
            destinations: [
              NavigationDestination(
                label: '',
                selectedIcon: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            child: Image.asset(
                          scale: 4,
                          'assets/images/nav/delivery_active.png',
                          fit: BoxFit.cover,
                        )),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBrightBlue(text: 'Delivery')
                      ],
                    ),
                  ),
                ),
                icon: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            scale: 4,
                            'assets/images/nav/delivery_inactive.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBlack(text: 'Delivery')
                      ],
                    ),
                  ),
                ),
              ),
              NavigationDestination(
                label: '',
                selectedIcon: Padding(
                  padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        scale: 4,
                        'assets/images/nav/support_active.png',
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: sizeFit(false, 4, context),
                      ),
                      const Ten500AppBrightBlue(text: 'Support')
                    ],
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        scale: 4,
                        'assets/images/nav/support_inactive.png',
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        height: sizeFit(false, 4, context),
                      ),
                      const Ten500AppBlack(text: 'Support')
                    ],
                  ),
                ),
              ),
              NavigationDestination(
                  label: '',
                  selectedIcon: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          scale: 4,
                          'assets/images/nav/history_active.png',
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBrightBlue(text: 'History')
                      ],
                    ),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          scale: 4,
                          'assets/images/nav/history_inactive.png',
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBlack(text: 'History')
                      ],
                    ),
                  )),
              NavigationDestination(
                label: '',
                selectedIcon: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          scale: 4,
                          'assets/images/nav/rider_active.png',
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBrightBlue(text: 'Account')
                      ],
                    ),
                  ),
                ),
                icon: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: sizeFit(false, 8, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          scale: 4,
                          'assets/images/nav/rider_inactive.png',
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        const Ten500AppBlack(text: 'Account')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
