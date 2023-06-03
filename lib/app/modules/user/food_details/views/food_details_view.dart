import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/food_details_controller.dart';

class FoodDetailsView extends GetView<FoodDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.pageView.value == ViewState.busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 48, context),
                            vertical: sizeFit(false, 16, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: sizeFit(false, 90, context),
                                backgroundImage: CachedNetworkImageProvider(
                                    controller
                                        .foodServices
                                        .foodMenus[(controller
                                            .foodServices.foodMenus
                                            .indexWhere((element) =>
                                                element.id == controller.id))]
                                        .foodImage!),
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 24, context),
                            ),
                            Center(
                              child: Text(
                                controller
                                    .foodServices
                                    .foodMenus[(controller
                                        .foodServices.foodMenus
                                        .indexWhere((element) =>
                                            element.id == controller.id))]
                                    .foodName!
                                    .capitalize!,
                                style: AppTextStyles.TwentyFour500TextBlack,
                              ),
                            ),
                            SizedBox(
                              height: sizeFit(false, 16, context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pricing',
                                      style: AppTextStyles.Sixteen400TextBlack,
                                    ),
                                    Text(
                                      'NGN ${controller.foodServices.foodMenus[(controller.foodServices.foodMenus.indexWhere((element) => element.id == controller.id))].foodPrice}',
                                      style: AppTextStyles.TwentySix400TextPink,
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: AppDarkColors.AppAsh,
                                  thickness: sizeFit(true, 3, context),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating',
                                      style: AppTextStyles.Sixteen400TextBlack,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                        Icon(
                                          CupertinoIcons.star,
                                          color: AppDarkColors.AppPrimaryPink,
                                          size: sizeFit(false, 18, context),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: sizeFit(false, 36, context),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Food Information',
                                  style: AppTextStyles.Sixteen400TextBlack,
                                ),
                                Text(
                                  controller
                                      .foodServices
                                      .foodMenus[(controller
                                          .foodServices.foodMenus
                                          .indexWhere((element) =>
                                              element.id == controller.id))]
                                      .foodDescription!
                                      .capitalize!,
                                  style: AppTextStyles.Fourteen400TextAsh,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: sizeFit(false, 36, context),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery info',
                                  style: AppTextStyles.Sixteen400TextBlack,
                                ),
                                Text(
                                  'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                                  style: AppTextStyles.Fourteen400TextAsh,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: sizeFit(false, 36, context),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Return policy',
                                  style: AppTextStyles.Sixteen400TextBlack,
                                ),
                                Text(
                                  'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                                  style: AppTextStyles.Fourteen400TextAsh,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: sizeFit(false, 20, context)),
                        child: AuthButton(
                          title: 'Order Now',
                          onTap: () {
                            controller.addToCart();
                          },
                        ),
                      ),
                    )
                  ],
                );
        }));
  }
}
