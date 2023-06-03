// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Out'),
          centerTitle: true,
        ),
        body: SafeArea(child: Obx(() {
          return controller.pageViewState.value == ViewState.busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: controller.formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sizeFit(true, 16, context),
                                  vertical: sizeFit(false, 24, context)),
                              child: Column(
                                children: [
                                  FosTextFieldWidget(
                                    hintText: 'Full name',
                                    textEditingController: controller.fullname,
                                    validator: (value) => value!.isNotEmpty
                                        ? null
                                        : "Please fill in Your Name",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 16, context),
                                  ),
                                  FosTextFieldWidget(
                                    hintText: 'email',
                                    textEditingController: controller.email,
                                    validator: (value) => value!.isNotEmpty
                                        ? null
                                        : "Please fill in Email",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 16, context),
                                  ),
                                  FosTextFieldWidget(
                                    hintText: 'phone',
                                    textEditingController: controller.phone,
                                    validator: (value) => value!.isNotEmpty
                                        ? null
                                        : "Please fill in Your phone number",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 16, context),
                                  ),
                                  FosTextFieldWidget(
                                    hintText: 'Address',
                                    textEditingController: controller.address,
                                    validator: (value) => value!.isNotEmpty
                                        ? null
                                        : "Please fill in amount",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 16, context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizeFit(true, 24, context)),
                            child: Text(
                              'Order List',
                              style: AppTextStyles.TwentyFour500TextBlack,
                            ),
                          ),
                          SizedBox(
                            height: sizeFit(false, 16, context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizeFit(true, 24, context)),
                            child: controller.cartService.cartList.isEmpty
                                ? Center(child: Text('Cart is Empty'))
                                : ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.cartService.cartList.length,
                                    itemBuilder: (context, index) {
                                      return CheckOutList(
                                        foodCost: controller
                                            .cartService.cartList
                                            .elementAt(index)
                                            .foodPrice!,
                                        foodName: controller
                                            .cartService.cartList
                                            .elementAt(index)
                                            .foodName!,
                                        resturantName: controller
                                            .cartService.cartList
                                            .elementAt(index)
                                            .foodName!,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: sizeFit(false, 16, context),
                          ),
                          controller.cartService.cartList.isEmpty
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sizeFit(true, 24, context)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total',
                                            style: AppTextStyles
                                                .Sixteen400TextBlack),
                                        Obx(() {
                                          return Text(
                                              'NGN${controller.total.value.toString()}',
                                              style:
                                                  AppTextStyles.Sixteen600Pink);
                                        }),
                                      ]),
                                ),
                          SizedBox(
                            height: sizeFit(false, 100, context),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: sizeFit(false, 60, context),
                        color: AppDarkColors.AppPrimaryWhite,
                        padding: EdgeInsets.only(
                            bottom: sizeFit(false, 10, context)),
                        child: AuthButton(
                          onTap: () {
                            if (controller.cartService.cartList.isEmpty) {
                              Get.snackbar('Warning', 'Cart is empty',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppDarkColors.AppRed,
                                  colorText: AppDarkColors.AppPrimaryWhite);
                            } else {
                              controller.makeFlutterwavePayment(context);
                            }
                          },
                          title: 'Make Payment',
                        ),
                      ),
                    )
                  ],
                );
        })));
  }
}

class CheckOutList extends StatelessWidget {
  final String foodName;
  final String resturantName;
  final num foodCost;
  const CheckOutList({
    Key? key,
    required this.foodName,
    required this.resturantName,
    required this.foodCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodName,
              style: AppTextStyles.Sixteen400TextBlack,
            ),
            Text(
              resturantName,
              style: AppTextStyles.Fourteen500TextAsh,
            ),
          ],
        ),
        Text(
          'NGN${foodCost.toString()}',
          style: AppTextStyles.Fourteen400TextPink,
        ),
      ],
    );
  }
}
