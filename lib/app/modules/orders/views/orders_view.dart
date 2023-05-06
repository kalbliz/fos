import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: Text('Orders'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: Icon(
                CupertinoIcons.cart,
                color: AppDarkColors.AppPrimaryBlack,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Obx(() {
            return controller.pageState.value == ViewState.busy
                ? Center(child: CircularProgressIndicator.adaptive())
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizeFit(true, 16, context)),
                    child: Column(
                      children: [
                        Obx(() {
                          return controller.orderServices.orderList.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sizeFit(true, 16, context),
                                      vertical: sizeFit(false, 24, context)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/home/empty_orders.png',
                                          fit: BoxFit.fitHeight,
                                          height: sizeFit(false, 300, context),
                                        ),
                                      ),
                                      SizedBox(
                                        height: sizeFit(false, 40, context),
                                      ),
                                      Text('AHHH! You have no food order yet')
                                    ],
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      controller.orderServices.orderList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                sizeFit(false, 10, context)),
                                        child: ListTile(
                                          onTap: () {
                                            Get.toNamed(Routes.ORDER_DETAILS,
                                                arguments: [
                                                  {"index": index}
                                                ]);
                                          },
                                          title: Text(controller
                                              .orderServices.orderList
                                              .elementAt(index)
                                              .id),
                                          subtitle: Text(controller
                                              .orderServices.orderList
                                              .elementAt(index)
                                              .status!),
                                          trailing: Text(
                                            controller.orderServices.orderList
                                                .elementAt(index)
                                                .total!
                                                .floor()
                                                .toString(),
                                            style: AppTextStyles
                                                .Fourteen400TextPink,
                                          ),
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: sizeFit(false, 16, context),
                                    );
                                  },
                                );
                        }),
                      ],
                    ),
                  );
          }),
        ));
  }
}
