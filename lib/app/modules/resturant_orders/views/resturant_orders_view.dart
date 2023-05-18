import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_orders_controller.dart';

class ResturantOrdersView extends GetView<ResturantOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppGrey,
        appBar: AppBar(
          backgroundColor: AppColors.AppGrey,
          title: Text(
            'Our Menu',
            style: TextStyle(color: AppColors.AppBackgroundRed),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          return controller.pageViewState.value == ViewState.busy
              ? const Center(child: CircularProgressIndicator.adaptive())
              : SafeArea(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeFit(true, 16, context),
                      ),
                      child: Obx(() {
                        return controller.foodServices.foodFromResturant.isEmpty
                            ? Text(
                                'There is no food on your menu',
                                style: AppTextStyles.Eighteen600TextWhite,
                              )
                            : GridView.builder(
                                itemCount: controller
                                    .foodServices.foodFromResturant.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(controller
                                          .foodServices.foodMenus[index].id!
                                          .toString());
                                      Get.toNamed(Routes.EDIT_FOOD, arguments: [
                                        {
                                          'id': controller.foodServices
                                              .foodFromResturant[index].id!
                                        }
                                      ]);
                                    },
                                    child: Container(
                                      // height: sizeFit(false, value, context),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sizeFit(true, 8, context),
                                          vertical: sizeFit(false, 8, context)),
                                      decoration: BoxDecoration(
                                          color: AppColors.AppBlackTwo,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              radius:
                                                  sizeFit(false, 40, context),
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                      controller
                                                          .foodServices
                                                          .foodFromResturant[
                                                              index]
                                                          .foodImage!)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.foodServices
                                                    .foodFromResturant
                                                    .elementAt(index)
                                                    .foodName!,
                                                style: AppTextStyles
                                                    .Eighteen600TextWhite,
                                              ),
                                              Text(
                                                'NGN${controller.foodServices.foodFromResturant.elementAt(index).foodPrice!}',
                                                style: AppTextStyles
                                                    .Sixteen600Pink,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing:
                                            sizeFit(false, 12, context),
                                        mainAxisSpacing:
                                            sizeFit(false, 12, context),
                                        crossAxisCount: 2),
                              );
                      })));
        }));
  }
}
