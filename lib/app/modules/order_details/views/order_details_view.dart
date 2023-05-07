import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsViews extends GetView<OrderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            return controller.pageState.value == ViewState.busy
                ? Center(child: CircularProgressIndicator.adaptive())
                : Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 16, context)),
                        child: Obx(() {
                          return controller.orderServices.orderList
                                  .elementAt(controller.index)
                                  .cartList!
                                  .isEmpty
                              ? Center(
                                  child: Text(
                                  'No Orders',
                                  style: AppTextStyles.Eighteen600TextBlack,
                                ))
                              : Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: controller
                                            .orderServices.orderList
                                            .elementAt(controller.index)
                                            .cartList!
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: sizeFit(
                                                    false, 10, context)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: sizeFit(
                                                          false, 40, context),
                                                      backgroundImage:
                                                          CachedNetworkImageProvider(
                                                              controller
                                                                  .orderServices
                                                                  .orderList
                                                                  .elementAt(
                                                                      controller
                                                                          .index)
                                                                  .cartList![
                                                                      index]
                                                                  .foodImage!),
                                                    ),
                                                    SizedBox(
                                                      width: sizeFit(
                                                          true, 16, context),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .orderServices
                                                              .orderList
                                                              .elementAt(
                                                                  controller
                                                                      .index)
                                                              .cartList![index]
                                                              .foodName!
                                                              .capitalize!,
                                                          style: AppTextStyles
                                                              .Sixteen500TextBlack,
                                                        ),
                                                        Text(
                                                          controller
                                                              .orderServices
                                                              .orderList
                                                              .elementAt(
                                                                  controller
                                                                      .index)
                                                              .cartList![index]
                                                              .time!
                                                              .toDate()
                                                              .toString(),
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: AppTextStyles
                                                              .Fourteen400TextAsh,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'NGN${controller.orderServices.orderList.elementAt(controller.index).cartList![index].foodPrice!.toString()}',
                                                  style: AppTextStyles
                                                      .Fourteen400TextPink,
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                );
                        }),
                      ),
                    ],
                  );
          }),
        ));
  }
}
