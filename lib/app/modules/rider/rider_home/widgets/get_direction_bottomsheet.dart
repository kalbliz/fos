import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/modules/rider/rider_home/controllers/rider_home_controller.dart';
import 'package:fos/app/modules/rider/rider_home/widgets/order_widget.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/helpers/launcher_functions.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:get/get.dart';

class GetDirectionBottomSheet extends StatelessWidget {
  GetDirectionBottomSheet({
    super.key,
  });

  final selectedOrder = Get.find<RiderServices>()
      .riderOrders
      .elementAt(Get.find<RiderServices>().selectedOrderIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeFit(false, 700, context),
      padding: EdgeInsets.symmetric(
        horizontal: sizeFit(true, 16, context),
        vertical: sizeFit(false, 32, context),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Fourteen500AppGreyNun(text: 'Customer'),
                    Fourteen500AppBlackNun(text: '${selectedOrder.clientName}')
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 4, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Fourteen500AppGreyNun(text: 'Order ID No.'),
                    Fourteen500AppBlackNun(
                      text: '${selectedOrder.id}'.toUpperCase(),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sizeFit(false, 24, context),
            ),
            //text & call
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    smsLaunchUri('${selectedOrder.clientPhoneNumber}');
                  },
                  child: Container(
                    height: sizeFit(false, 48, context),
                    width: sizeFit(true, 165, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppDarkColors.AppPrimaryPink),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.chat_bubble_2,
                        color: AppDarkColors.AppPrimaryPink,
                        size: sizeFit(false, 22, context),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    makeLocalPhoneCall('${selectedOrder.clientPhoneNumber}');
                  },
                  child: Container(
                    height: sizeFit(false, 48, context),
                    width: sizeFit(true, 165, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.AppSwitchGreen,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.phone,
                        color: AppColors.AppBackgroundWhite,
                        size: sizeFit(false, 22, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: sizeFit(false, 12, context),
            ),
            Obx(() => AuthButton(
                  boxColror: AppDarkColors.AppPrimaryPink,
                  titleColor: AppColors.AppBackgroundWhite,
                  isIdle: Get.find<RiderHomeController>()
                          .getDirectionViewState
                          .value ==
                      ViewState.idle,
                  title: 'Get directions',
                  leading: Get.find<RiderHomeController>()
                              .getDirectionViewState
                              .value ==
                          ViewState.busy
                      ? null
                      : const Icon(Icons.location_on_outlined,
                          color: Colors.white),
                  onTap: () {
                    if (Get.find<RiderHomeController>()
                            .getDirectionViewState
                            .value ==
                        ViewState.idle) {
                      Get.find<RiderHomeController>().getDeliveryDirection();
                    }
                    // Get.toNamed(Routes.DELIVERY_SUCCESS);
                  },
                )),
            SizedBox(
              height: sizeFit(false, 24, context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Fourteen500AppGreyNun(text: 'Pickup at'),
                SizedBox(
                  height: sizeFit(false, 4, context),
                ),
                Fourteen500AppBlackNun(
                    text:
                        '${selectedOrder.cartList!.elementAt(0).resturantName} resturant')
              ],
            ),
            const Divider(
              thickness: 0.7,
            ),
            SizedBox(
              height: sizeFit(false, 370, context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Fourteen500AppGreyNun(text: 'Deliver to'),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: sizeFit(false, 8, context),
                            ),
                            Fourteen500AppBlackNun(
                                text: '- ${selectedOrder.clientLocation}'),
                          ],
                        );
                      },
                      separatorBuilder: (context, _) {
                        return const SizedBox();
                      },
                      itemCount: selectedOrder.cartList!.length,
                    ),
                    const Divider(
                      thickness: 0.7,
                    ),
                    SizedBox(
                      height: sizeFit(false, 8, context),
                    ),
                    Fourteen500AppGreyNun(
                        text:
                            'Order details(${selectedOrder.cartList!.length})'),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    SizedBox(
                      height: sizeFit(false, 240, context),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return OrderDetailsWidget(index: index);
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: sizeFit(true, 8, context),
                            ),
                            child: const Divider(
                              thickness: 0.7,
                            ),
                          );
                        },
                        itemCount: selectedOrder.cartList!.length,
                      ),
                    ),
                    // const OrderDetailsWidet(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
