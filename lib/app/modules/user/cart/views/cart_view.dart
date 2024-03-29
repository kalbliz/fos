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

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
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
                          return controller.cartServices.cartList.isEmpty
                              ? Center(
                                  child: Text(
                                  'Cart is Empty',
                                  style: AppTextStyles.Eighteen600TextBlack,
                                ))
                              : Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: controller
                                            .cartServices.cartList.length,
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
                                                                  .cartServices
                                                                  .cartList[
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
                                                              .cartServices
                                                              .cartList[index]
                                                              .foodName!,
                                                          style: AppTextStyles
                                                              .Sixteen500TextBlack,
                                                        ),
                                                        Text(
                                                          'View',
                                                          style: AppTextStyles
                                                              .Fourteen400TextPink,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    CupertinoIcons.delete,
                                                    color: AppDarkColors
                                                        .AppPrimaryPink,
                                                    size: sizeFit(
                                                        false, 20, context),
                                                  ),
                                                  onPressed: () {
                                                    controller.deleteFromCart(
                                                        controller
                                                            .cartServices
                                                            .cartList[index]
                                                            .id);
                                                    debugPrint(controller
                                                        .cartServices
                                                        .cartList[index]
                                                        .id);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                );
                        }),
                      ),
                      controller.cartServices.cartList.isEmpty
                          ? SizedBox()
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: sizeFit(false, 10, context)),
                                  child: AuthButton(
                                      title: 'Complete Order',
                                      onTap: () {
                                        Get.toNamed(Routes.CHECK_OUT);
                                      })))
                    ],
                  );
          }),
        ));
  }
}
