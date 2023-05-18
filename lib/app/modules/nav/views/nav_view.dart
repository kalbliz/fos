import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/user_type.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class NavView extends GetView<NavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() => controller.userStatus.value == 'user'
            ? controller.userPages[controller.tabIndex.value]
            : controller.resturantPages[controller.tabIndex.value]),
        bottomNavigationBar: Obx(() => controller.userStatus.value == 'user'
            ? NavigationBar(
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                backgroundColor: AppDarkColors.AppPrimaryWhite,
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
                      label: 'Search',
                      selectedIcon: SizedBox(
                        child: Icon(
                          CupertinoIcons.search,
                          color: AppDarkColors.AppPrimaryPink,
                        ),
                      ),
                      icon: SizedBox(
                        child: Icon(
                          CupertinoIcons.search,
                          color: AppDarkColors.AppAsh,
                        ),
                      )),
                  const NavigationDestination(
                      label: 'Orders',
                      selectedIcon: SizedBox(
                        child: Icon(
                          CupertinoIcons.list_bullet_indent,
                          color: AppDarkColors.AppPrimaryPink,
                        ),
                      ),
                      icon: SizedBox(
                        child: Icon(
                          CupertinoIcons.list_bullet_indent,
                          color: AppDarkColors.AppAsh,
                        ),
                      )),
                  const NavigationDestination(
                      label: 'Account',
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
              )
            : NavigationBar(
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
