import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

import 'package:get/get.dart';

import '../controllers/resturant_nav_controller.dart';

class ResturantNavView extends GetView<ResturantNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() => controller.resturantPages[controller.tabIndex.value]),
        bottomNavigationBar: Obx(() => NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              backgroundColor: AppColors.AppGrey,
              height: sizeFit(false, 70, context),
              surfaceTintColor: AppDarkColors.AppAsh,
              elevation: 0,
              selectedIndex: controller.tabIndex.value,
              onDestinationSelected: (index) {
                controller.changeTabIndex(index);
              },
              // ignore: prefer_const_literals_to_create_immutables
              destinations: [
                const NavigationDestination(
                    label: 'Home',
                    selectedIcon: SizedBox(
                      child: Icon(
                        CupertinoIcons.home,
                        color: AppDarkColors.AppPrimaryPink,
                      ),
                    ),
                    icon: SizedBox(
                      child: Icon(
                        CupertinoIcons.home,
                        color: AppDarkColors.AppAsh,
                      ),
                    )),
                const NavigationDestination(
                    label: 'Add Food',
                    selectedIcon: SizedBox(
                      child: Icon(
                        CupertinoIcons.add,
                        color: AppDarkColors.AppPrimaryPink,
                      ),
                    ),
                    icon: SizedBox(
                      child: Icon(
                        CupertinoIcons.add,
                        color: AppDarkColors.AppAsh,
                      ),
                    )),
                const NavigationDestination(
                    label: 'Menu',
                    selectedIcon: SizedBox(
                      child: Icon(
                        CupertinoIcons.list_bullet,
                        color: AppDarkColors.AppPrimaryPink,
                      ),
                    ),
                    icon: SizedBox(
                      child: Icon(
                        CupertinoIcons.list_bullet,
                        color: AppDarkColors.AppAsh,
                      ),
                    )),
                const NavigationDestination(
                    label: 'Profile',
                    selectedIcon: SizedBox(
                      child: Icon(
                        CupertinoIcons.person,
                        color: AppDarkColors.AppPrimaryPink,
                      ),
                    ),
                    icon: SizedBox(
                      child: Icon(
                        CupertinoIcons.person,
                        color: AppDarkColors.AppAsh,
                      ),
                    )),
              ],
            )));
  }
}
