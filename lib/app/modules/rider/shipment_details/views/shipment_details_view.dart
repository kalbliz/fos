// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import '../controllers/shipment_details_controller.dart';

class ShipmentDetailsView extends GetView<ShipmentDetailsController> {
  const ShipmentDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppBackgroundWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.AppBackgroundWhite,
        title: const Eighteen500AppBlack(text: 'History details'),
        centerTitle: true,
        leading: const BackButton(),
        leadingWidth: sizeFit(true, 75, context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeFit(true, 16, context),
              vertical: sizeFit(false, 25, context),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Sixteen500AppBlack(text: 'Pickup information'),
                  SizedBox(
                    width: sizeFit(true, 16, context),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 4, context),
                      vertical: sizeFit(false, 2, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: controller.riderServices.riderHistory
                                  .elementAt(controller
                                      .riderServices.selectedHistoryIndex)
                                  .status ==
                              'pending'
                          ? AppColors.AppBackgroundYellow
                          : controller.riderServices.riderHistory
                                      .elementAt(controller
                                          .riderServices.selectedHistoryIndex)
                                      .status ==
                                  'transit'
                              ? AppColors.AppOrangeBackground
                              : controller.riderServices.riderHistory
                                          .elementAt(controller.riderServices
                                              .selectedHistoryIndex)
                                          .status ==
                                      'cancelled'
                                  ? AppColors.AppBackgroundYellow
                                  : controller.riderServices.riderHistory
                                              .elementAt(controller
                                                  .riderServices
                                                  .selectedHistoryIndex)
                                              .status ==
                                          'completed'
                                      ? AppColors.AppLightGreen
                                      : AppColors.AppPink,
                    ),
                    child: Text(
                      controller.riderServices.riderHistory
                          .elementAt(
                              controller.riderServices.selectedHistoryIndex)
                          .status!
                          .toUpperCase(),
                      style: GoogleFonts.nunito(
                        color: controller.riderServices.riderHistory
                                    .elementAt(controller
                                        .riderServices.selectedHistoryIndex)
                                    .status ==
                                'PENDING'.toLowerCase()
                            ? AppColors.AppYellow
                            : controller.riderServices.riderHistory
                                        .elementAt(controller
                                            .riderServices.selectedHistoryIndex)
                                        .status ==
                                    'transit'.toLowerCase()
                                ? AppColors.AppOrange
                                : controller.riderServices.riderHistory
                                            .elementAt(controller.riderServices
                                                .selectedHistoryIndex)
                                            .status ==
                                        'cancelled'.toLowerCase()
                                    ? AppColors.AppYellow
                                    : controller.riderServices.riderHistory
                                                .elementAt(controller
                                                    .riderServices
                                                    .selectedHistoryIndex)
                                                .status ==
                                            'completed'.toLowerCase()
                                        ? AppColors.AppGreen
                                        : AppColors.AppPink,
                        fontWeight: FontWeight.w600,
                        fontSize: sizeFit(false, 12, context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeFit(true, 16, context),
              ),

              //pick up name
              InfoWidget(
                nameTitle: 'Order Id',
                phoneTitle: 'Resturant Name',
                addressTitle: 'Date',
                controller: controller,
                address: controller.riderServices.riderHistory
                    .elementAt(controller.riderServices.selectedHistoryIndex)
                    .createdAt!,
                name: controller.riderServices.riderHistory
                    .elementAt(controller.riderServices.selectedHistoryIndex)
                    .id!,
                phone: controller.riderServices.riderHistory
                    .elementAt(controller.riderServices.selectedHistoryIndex)
                    .resturantName!,
              ),

              Divider(
                height: sizeFit(false, 24, context),
              ),
              const Sixteen500AppBlack(text: 'Dropoff Information'),
              SizedBox(
                height: sizeFit(true, 16, context),
              ),

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InfoWidget(
                    nameTitle: 'Client Name',
                    phoneTitle: 'Client Phone Number',
                    addressTitle: 'Client Address',
                    controller: controller,
                    address: controller.riderServices.riderHistory
                        .elementAt(
                            controller.riderServices.selectedHistoryIndex)
                        .clientLocation!,
                    name: controller.riderServices.riderHistory
                        .elementAt(
                            controller.riderServices.selectedHistoryIndex)
                        .clientName!,
                    phone: controller.riderServices.riderHistory
                        .elementAt(
                            controller.riderServices.selectedHistoryIndex)
                        .clientPhoneNumber!,
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: sizeFit(false, 16, context),
                      ),
                      Container(
                        width: sizeFit(true, 280, context),
                        height: sizeFit(false, 2, context),
                        color: AppColors.AppTextBoxGrey,
                      ),
                      SizedBox(
                        height: sizeFit(false, 16, context),
                      ),
                    ],
                  );
                },
                itemCount: controller.riderServices.riderHistory
                    .elementAt(controller.riderServices.selectedHistoryIndex)
                    .cartList!
                    .length,
              ),
              Divider(
                height: sizeFit(false, 24, context),
              ),

              //Parcels
              const Sixteen500AppBlack(text: 'Parcel(s)'),
              SizedBox(
                height: sizeFit(false, 16, context),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ParcelWidget(
                      item: controller.riderServices.riderHistory
                          .elementAt(
                              controller.riderServices.selectedHistoryIndex)
                          .cartList!
                          .elementAt(index)
                          .foodName!,
                      value:
                          'NGN${controller.riderServices.riderHistory.elementAt(controller.riderServices.selectedHistoryIndex).cartList!.elementAt(index).foodPrice!}');
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: sizeFit(false, 32, context),
                  );
                },
                itemCount: controller.riderServices.riderHistory
                    .elementAt(controller.riderServices.selectedHistoryIndex)
                    .cartList!
                    .length,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String nameTitle;
  final String phoneTitle;
  final String addressTitle;
  const InfoWidget({
    Key? key,
    required this.name,
    required this.phone,
    required this.address,
    required this.nameTitle,
    required this.phoneTitle,
    required this.addressTitle,
    required this.controller,
  }) : super(key: key);

  final ShipmentDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fourteen400AppGreyNun(text: nameTitle),
            Fourteen400AppAsh(text: name)
          ],
        ),
        SizedBox(
          height: sizeFit(false, 16, context),
        ),
        //pick up phone
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fourteen400AppGreyNun(text: phoneTitle),
            Fourteen400AppAsh(text: ' $phone')
          ],
        ),
        SizedBox(
          height: sizeFit(false, 16, context),
        ),
        //pick up address
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fourteen400AppGreyNun(text: addressTitle),
            Fourteen400AppAsh(text: address)
          ],
        ),
      ],
    );
  }
}

class ParcelWidget extends StatelessWidget {
  final String item;

  final String value;

  const ParcelWidget({
    super.key,
    required this.item,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              PaymentInfoWidget(
                title: 'Item',
                response: item,
              ),
              SizedBox(
                height: sizeFit(false, 8, context),
              ),
              PaymentInfoWidget(
                title: 'Value',
                response: value,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: sizeFit(false, 16, context),
          );
        },
        itemCount: 1);
  }
}

class PickUpInfoWidget extends StatelessWidget {
  final String title;
  final String response;
  const PickUpInfoWidget({
    Key? key,
    required this.title,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Fourteen400AppGreyNun(text: title),
        Fourteen400AppAsh(text: response)
      ],
    );
  }
}

class PaymentInfoWidget extends StatelessWidget {
  final String title;
  final String response;
  const PaymentInfoWidget({
    Key? key,
    required this.title,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Fourteen400AppGreyNun(text: title),
        Fourteen400AppAsh(text: response)
      ],
    );
  }
}

class PickUpInfoWidgetModel {
  final String title;
  String response;
  PickUpInfoWidgetModel({
    Key? key,
    required this.title,
    required this.response,
  });
}

class PaymentInfoWidgetModel {
  final String title;
  String response;
  PaymentInfoWidgetModel({
    Key? key,
    required this.title,
    required this.response,
  });
}

class ParcelListModel {
  final String item;
  final String weight;
  final String quality;
  final String value;
  ParcelListModel({
    required this.item,
    required this.weight,
    required this.quality,
    required this.value,
  });
}
