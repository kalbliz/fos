// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/resturant_home/widgets/all_orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_home/widgets/cancelled_orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_home/widgets/completed_orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_home/widgets/pending_orders_view.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:fos/app/utilities/text_style/tens.dart';
import 'package:get/get.dart';

import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import '../controllers/resturant_home_controller.dart';

class ResturantHomeView extends GetView<ResturantHomeController> {
  const ResturantHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppBackgroundWhite,
        appBar: AppBar(
          title: Text('Welcome ${controller.authService.userName.capitalize}'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.AppBackgroundWhite,
        ),
        body: Obx(() {
          return controller.pageViewState.value == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 16, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                          isScrollable: true,
                          controller: controller.tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: AppDarkColors.AppPrimaryPink,
                          onTap: (int index) {
                            debugPrint(index.toString());
                            controller.currentTabIndex.value = index;
                          },
                          tabs: [
                            Tab(
                              child: Row(children: [
                                const Fourteen400AppBlackNun(
                                    text: 'All Orders'),
                                SizedBox(
                                  width: sizeFit(true, 4, context),
                                ),
                                Container(
                                  height: sizeFit(false, 20, context),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Obx(() {
                                      return Ten500AppBlack(
                                        text:
                                            '${controller.foodService.allOrdersList.length}',
                                      );
                                    }),
                                  ),
                                )
                              ]),
                            ),
                            Tab(
                              child: Row(children: [
                                const Fourteen400AppBlackNun(text: 'Pending'),
                                SizedBox(
                                  width: sizeFit(true, 4, context),
                                ),
                                Container(
                                  height: sizeFit(false, 20, context),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Obx(() {
                                      return Ten500AppBlack(
                                        text:
                                            '${controller.foodService.pendingOrdersList.length}',
                                      );
                                    }),
                                  ),
                                )
                              ]),
                            ),
                            Tab(
                              child: Row(children: [
                                const Fourteen400AppBlackNun(text: 'Completed'),
                                SizedBox(
                                  width: sizeFit(true, 4, context),
                                ),
                                Container(
                                  height: sizeFit(false, 20, context),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(217, 217, 217, 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Obx(() {
                                      return Ten500AppBlack(
                                          text:
                                              '${controller.foodService.completedOrdersList.length}');
                                    }),
                                  ),
                                )
                              ]),
                            ),
                            Tab(
                              child: Row(children: [
                                const Fourteen400AppBlackNun(text: 'Cancelled'),
                                SizedBox(
                                  width: sizeFit(true, 4, context),
                                ),
                                Container(
                                  height: sizeFit(false, 20, context),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Obx(() {
                                      return Ten500AppBlack(
                                        text:
                                            '${controller.foodService.cancelledOrdersList.length}',
                                      );
                                    }),
                                  ),
                                )
                              ]),
                            ),
                          ]),
                      Expanded(
                        child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              AllOrderView(),
                              PendingOrderView(),
                              CompletedOrdersView(),
                              CancelledOrderView()
                            ]),
                      )
                    ],
                  ),
                ));
        }));
  }
}
