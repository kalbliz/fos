import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import 'package:get/get.dart';

import '../controllers/resturant_nav_controller.dart';

class ResturantNavView extends GetView<ResturantNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() => controller.resturantPages[controller.tabIndex.value]),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          openButtonHeroTag: UniqueKey(),
          type: ExpandableFabType.up,
          key: controller.fabKey,
          overlayStyle: ExpandableFabOverlayStyle(
            blur: 5,
          ),
          distance: sizeFit(false, 80, context),
          expandedFabSize: ExpandableFabSize.small,
          child: Icon(
            Icons.add,
            size: sizeFit(false, 20, context),
            color: AppColors.AppBackgroundWhite,
          ),
          backgroundColor: AppDarkColors.AppPrimaryPink,
          closeButtonStyle: const ExpandableFabCloseButtonStyle(
              backgroundColor: AppDarkColors.AppPrimaryPink),
          children: [
            FloatingActionButton.extended(
              heroTag: UniqueKey(),
              extendedPadding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 8, context),
              ),
              backgroundColor: AppColors.AppFabBackground,
              elevation: 0,
              label: const Fourteen400AppBlackNun(text: 'Create Rider'),
              onPressed: () {
                final state = controller.fabKey.currentState;
                if (state != null) {
                  state.toggle();
                  // Get.toNamed(Routes.CREATE_RIDER);
                  Get.find<ResturantHomeController>().getresturantOrders();
               
                }
              },
            ),
            FloatingActionButton.extended(
              heroTag: UniqueKey(),
              extendedPadding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 8, context),
              ),
              backgroundColor: AppColors.AppFabBackground,
              elevation: 0,
              label: const Fourteen400AppBlackNun(text: 'Add New Food'),
              onPressed: () {
                final state = controller.fabKey.currentState;
                if (state != null) {
                  state.toggle();
                  Get.toNamed(Routes.CREATE_FOOD);
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: Obx(() => NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              backgroundColor: AppColors.AppBlack,
              height: sizeFit(false, 70, context),
              surfaceTintColor: AppDarkColors.AppAsh,
              elevation: 0,
              selectedIndex: controller.tabIndex.value,
              onDestinationSelected: (index) {
                controller.changeTabIndex(index);
              },
              destinations: const [
                NavigationDestination(
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
                NavigationDestination(
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
                NavigationDestination(
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
