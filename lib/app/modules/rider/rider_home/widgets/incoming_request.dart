import 'package:flutter/material.dart';
import 'package:fos/app/modules/rider/rider_home/controllers/rider_home_controller.dart';
import 'package:fos/app/modules/rider/rider_home/widgets/accept_form.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IncomingDeliveryRequest extends StatelessWidget {
  IncomingDeliveryRequest({
    super.key,
    required this.index,
  });
  final int index;
  final controller = Get.find<RiderHomeController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          left: sizeFit(true, 16, context),
          right: sizeFit(true, 16, context),
          top: sizeFit(false, 20, context),
          bottom: sizeFit(false, 8, context),
        ),
        height: sizeFit(false, 240, context),
        width: sizeFit(true, 340, context),
        decoration: BoxDecoration(
          color: AppColors.AppBackgroundWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              sizeFit(false, 16, context),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(
                    text:
                        'Drop off on ${DateFormat('yyyy-MM-dd').format(controller.riderServices.riderOrders.elementAt(index).cartList!.first.time!.toDate())}'),
                Fourteen500AppBlackNun(
                    text:
                        '${index + 1} / ${controller.riderServices.riderOrders.length}'),
                // const Fourteen500AppGreyNun(text: 'Deliver by 1:00 PM'),
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            Fourteen500AppBlackNun(
                text:
                    '${controller.riderServices.riderOrders.elementAt(index).clientLocation}'),
            SizedBox(
              height: sizeFit(false, 6, context),
            ),
            Fourteen500AppGreyNun(
                text:
                    '${controller.riderServices.riderOrders.elementAt(index).cartList!.length} item(s)'),
            SizedBox(
              height: sizeFit(false, 6, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Fourteen500AppGreyNun(text: 'Payment Status'),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeFit(true, 4, context),
                    vertical: sizeFit(false, 2, context),
                  ),
                  decoration: BoxDecoration(
                    color: controller.riderServices.riderOrders
                                .elementAt(index)
                                .paymentStatus!
                                .toUpperCase() ==
                            'PAID'
                        ? AppColors.AppLightGreen
                        : controller.riderServices.riderOrders
                                    .elementAt(index)
                                    .paymentStatus!
                                    .toUpperCase() ==
                                'UNPAID'
                            ? AppColors.AppBackgroundYellow
                            : AppColors.AppPink,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    controller.riderServices.riderOrders
                        .elementAt(index)
                        .paymentStatus!
                        .toUpperCase(),
                    style: GoogleFonts.nunito(
                      color: controller.riderServices.riderOrders
                                  .elementAt(index)
                                  .paymentStatus!
                                  .toUpperCase() ==
                              'PAID'
                          ? AppColors.AppGreen
                          : controller.riderServices.riderOrders
                                      .elementAt(index)
                                      .paymentStatus!
                                      .toUpperCase() ==
                                  'UNPAID'
                              ? AppColors.AppYellow
                              : AppColors.AppRed,
                      fontWeight: FontWeight.w600,
                      fontSize: sizeFit(false, 12, context),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: sizeFit(false, 16, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.setSelectedRequestIndex(index);
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: sizeFit(true, 16, context),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: AcceptForm(),
                          );
                        });
                  },
                  child: Container(
                    height: sizeFit(false, 48, context),
                    width: sizeFit(true, 140, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.AppBlack),
                    child: const Center(
                      child: Fourteen500AppWhite(text: 'Accept'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.setSelectedRequestIndex(index);
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: sizeFit(true, 16, context),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            // child: DeclineForm(),
                          );
                        });
                  },
                  child: Container(
                    height: sizeFit(false, 48, context),
                    width: sizeFit(true, 140, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.AppRed),
                    ),
                    child: const Center(
                      child: Fourteen500AppRed(text: 'Decline'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
