import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/rider/rider_home/controllers/rider_home_controller.dart';
import 'package:fos/app/modules/rider/rider_home/widgets/order_widget.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:get/get.dart';

import '../../../../utilities/text_style/fourteens.dart';

class AcceptForm extends StatelessWidget {
  AcceptForm({
    super.key,
  });

  final RiderHomeController controller = Get.find<RiderHomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: sizeFit(false, 28, context),
        left: sizeFit(true, 16, context),
        right: sizeFit(true, 16, context),
        bottom: sizeFit(false, 16, context),
      ),
      width: double.infinity - 32,
      height: sizeFit(false, 260, context),
      decoration: BoxDecoration(
          color: AppColors.AppBackgroundWhite,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Image.asset(
            'assets/images/nav/accept_delivery.png',
            scale: 4,
          ),
          SizedBox(
            height: sizeFit(false, 24, context),
          ),
          const Sixteen500AppBlack(text: 'Would you like to start delivery?'),
          SizedBox(
            height: sizeFit(false, 2, context),
          ),
          const Twelve400AppAsh(
              alignment: TextAlign.center,
              text:
                  'Can you start your delivery now or save this shipment to the history page.'),
          SizedBox(
            height: sizeFit(false, 16, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  Get.back();
                },
                child: Container(
                  height: sizeFit(false, 35, context),
                  width: sizeFit(true, 150, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.AppBackgroundBlue),
                  ),
                  child: const Center(
                    child: Fourteen500AppBackgroundBlueNun(
                      text: 'Save for later',
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: sizeFit(false, 35, context),
                  width: sizeFit(true, 150, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.AppBackgroundBlue),
                  child: const Center(
                    child: Fourteen500AppWhite(
                      text: 'Start delivery',
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ClickAfterDeliveryBottomSheet extends StatelessWidget {
  const ClickAfterDeliveryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeFit(false, 700, context),
      padding: EdgeInsets.symmetric(
          horizontal: sizeFit(true, 16, context),
          vertical: sizeFit(false, 32, context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(16), right: Radius.circular(16))),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Fourteen500AppGreyNun(text: 'Customer'),
                Fourteen500AppBlackNun(text: 'Helen Nwachkwu')
              ]),
              SizedBox(
                height: sizeFit(false, 4, context),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Fourteen500AppGreyNun(text: 'Order ID No.'),
                Fourteen500AppBlackNun(text: '4BE711EF')
              ]),
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
                onTap: () {},
                child: Container(
                  height: sizeFit(false, 48, context),
                  width: sizeFit(true, 165, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.AppBackgroundBlue)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.chat_bubble_2,
                      color: AppColors.AppBackgroundBlue,
                      size: sizeFit(false, 22, context),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: sizeFit(false, 48, context),
                  width: sizeFit(true, 165, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.AppSwitchGreen),
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
          AuthButton(
            title: 'Click after delivery',
            onTap: () {},
          ),
          SizedBox(
            height: sizeFit(false, 24, context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Fourteen500AppGreyNun(text: 'Pickup at'),
              SizedBox(
                height: sizeFit(false, 4, context),
              ),
              Fourteen500AppBlackNun(
                  text: '10B Admiralty Way, Street 106104, Lagos, Nigeria')
            ],
          ),
          Divider(
            thickness: 0.7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Fourteen500AppGreyNun(text: 'Deliver to'),
              SizedBox(
                height: sizeFit(false, 4, context),
              ),
              Fourteen500AppBlackNun(
                  text:
                      '10B Chief Albert Iyorah Street off Babatunde Anjous, Admiralty Way, Street 106104, Lagos, Nigeria')
            ],
          ),
          Divider(
            thickness: 0.7,
          ),
          SizedBox(
            height: sizeFit(false, 8, context),
          ),
          Fourteen500AppGreyNun(text: 'Order details'),
          SizedBox(
            height: sizeFit(false, 4, context),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return OrderDetailsWidget(
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: sizeFit(false, 32, context),
                );
              },
              itemCount: 3),
        ]),
      ),
    );
  }
}
