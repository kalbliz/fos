import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/resturant_order_detail_controller.dart';

class ResturantOrderDetailView extends GetView<ResturantOrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Order Details'),
            centerTitle: true,
            actions: [
              controller.foodService.ordersListInUse
                          .elementAt(controller.indexInUse)
                          .rider
                          ?.name ==
                      null
                  ? PopupMenuButton(
                      onSelected: (result) {
                        Get.toNamed(Routes.ASSIGN_RIDER);
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.AppBlack,
                        size: sizeFit(false, 22, context),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Sixteen500AppBlack(text: 'Assign rider'),
                                Fourteen400AppGreyNun(
                                    text: 'Assign this order to a rider')
                              ],
                            ),
                          ),
                        ];
                      },
                    )
                  : SizedBox(),
            ]),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 16, context),
                vertical: sizeFit(false, 10, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Sixteen500AppBlackMont(
                      text: 'DropOff Details',
                    ),
                    SizedBox(
                      width: sizeFit(true, 16, context),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 6, context),
                          vertical: sizeFit(false, 2, context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.AppAsh),
                      child: Text(
                        controller.foodService.ordersListInUse
                            .elementAt(controller.foodService.index)
                            .status!
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: sizeFit(false, 12, context),
                            color: AppColors.AppBackgroundWhite),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Fourteen400AppAsh(text: 'Name'),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        Fourteen400AppBackgroundBlueNun(
                            text: controller.foodService.ordersListInUse
                                .elementAt(controller.indexInUse)
                                .clientName!)
                      ],
                    ),
                    SizedBox(
                      height: sizeFit(false, 8, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Fourteen400AppAsh(text: 'Phone Number'),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        Fourteen400AppBackgroundBlueNun(
                            text: controller.foodService.ordersListInUse
                                .elementAt(controller.indexInUse)
                                .clientPhoneNumber!)
                      ],
                    ),
                    SizedBox(
                      height: sizeFit(false, 8, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Fourteen400AppAsh(text: 'Address'),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        Fourteen400AppBackgroundBlueNun(
                            text: controller.foodService.ordersListInUse
                                .elementAt(controller.indexInUse)
                                .clientLocation!)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Divider(),
                const Sixteen500AppBlackMont(
                  text: 'Rider',
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Fourteen400AppAsh(text: 'Assigned Rider'),
                        Fourteen500AppBlackNun(
                            text: controller.foodService.ordersListInUse
                                    .elementAt(controller.indexInUse)
                                    .rider!
                                    .name ??
                                'NOT ASSIGNED')
                      ],
                    ),
                    SizedBox(
                      height: sizeFit(false, 8, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Fourteen400AppAsh(text: 'Rider Phone Number'),
                        Fourteen500AppBlackNun(
                            text: controller.foodService.ordersListInUse
                                    .elementAt(controller.indexInUse)
                                    .rider!
                                    .phone ??
                                'NOT ASSIGNED')
                      ],
                    ),
                    SizedBox(
                      height: sizeFit(false, 8, context),
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Divider(),
                const Sixteen500AppBlackMont(
                  text: 'Cart List',
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Fourteen400AppAsh(text: 'Item'),
                              Fourteen500AppBlackNun(
                                  text: controller.foodService.ordersListInUse
                                      .elementAt(controller.indexInUse)
                                      .cartList!
                                      .elementAt(index)
                                      .foodName!)
                            ],
                          ),
                          SizedBox(
                            height: sizeFit(false, 8, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Fourteen400AppAsh(text: 'Price'),
                              Fourteen500AppBlackNun(
                                  text:
                                      'NGN${controller.foodService.ordersListInUse.elementAt(controller.indexInUse).cartList!.elementAt(index).foodPrice!}')
                            ],
                          ),
                          SizedBox(
                            height: sizeFit(false, 8, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Fourteen400AppAsh(text: 'Date'),
                              Fourteen500AppBlackNun(
                                  text:
                                      '${controller.foodService.ordersListInUse.elementAt(controller.indexInUse).cartList!.elementAt(index).time!.toDate()}')
                            ],
                          ),
                          SizedBox(
                            height: sizeFit(false, 8, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Fourteen400AppAsh(text: 'Quantity'),
                              Fourteen500AppBlackNun(
                                  text:
                                      // '${controller.foodService.ordersListInUse.elementAt(controller.indexInUse).cartList!.elementAt(index).quantity}'
                                       '1'
                                      )
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: sizeFit(false, 20, context),
                      );
                    },
                    itemCount: controller.foodService.ordersListInUse
                        .elementAt(controller.indexInUse)
                        .cartList!
                        .length)
              ],
            ),
          ),
        )));
  }
}
