import 'package:flutter/material.dart';
import 'package:fos/app/modules/rider/rider_history/widgets/shipment_details.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import 'package:get/get.dart';

import '../controllers/rider_history_controller.dart';

class RiderHistoryView extends GetView<RiderHistoryController> {
  const RiderHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppBackgroundWhite,
        appBar: AppBar(
          title: const Eighteen500AppBlack(text: 'History'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.AppBackgroundWhite,
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeFit(true, 16, context),
              vertical: sizeFit(false, 16, context),
            ),
            child: Column(
              children: [
                controller.riderServices.riderHistory.isEmpty
                    ? const Sixteen400AppBlack(text: 'No History Available')
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.riderServices.riderHistory.length,
                        controller: ScrollController(),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: AppColors.AppLightGrey,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ShipmentDetailsWidget(
                            customer: controller.riderServices.riderHistory
                                .elementAt(index)
                                .clientName!,
                            date: controller.riderServices.riderHistory
                                .elementAt(index)
                                .createdAt!,
                            orderid: controller.riderServices.riderHistory
                                .elementAt(index)
                                .id!,
                            paymentStatus: controller.riderServices.riderHistory
                                .elementAt(index)
                                .paymentStatus!,
                            price: controller.riderServices.riderHistory
                                .elementAt(index)
                                .total
                                .toString(),
                            noOfparcel: controller.riderServices.riderHistory
                                .elementAt(index)
                                .cartList!
                                .length
                                .toString(),
                            status: controller.riderServices.riderHistory
                                .elementAt(index)
                                .status!,
                            onTap: () {
                              controller.riderServices.selectedHistoryIndex =
                                  index;
                              Get.toNamed(Routes.SHIPMENT_DETAILS, arguments: [
                                {"previous-list": "pending"}
                              ]);
                            },
                            fleet: controller.riderServices.riderHistory
                                .elementAt(index)
                                .resturantName!,
                          );
                        }),
              ],
            ),
          ),
        ));
  }
}
