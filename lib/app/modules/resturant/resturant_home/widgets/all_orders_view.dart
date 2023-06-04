import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:get/get.dart';
import 'package:fos/app/routes/app_pages.dart';

class AllOrderView extends StatelessWidget {
  AllOrderView({super.key});
  final controller = Get.find<ResturantHomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.foodService.allOrdersList.isEmpty
          ? const Center(child: Text('No Completed Orders'))
          : ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int orderIndex) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.RESTURANT_ORDER_DETAIL);
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 8, context),
                          vertical: sizeFit(false, 16, context)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Order ID: # ',
                                        style:
                                            AppTextStyles.Fourteen600TextBlack,
                                      ),
                                      Text(
                                        '${controller.foodService.allOrdersList.elementAt(orderIndex).id}'
                                            .substring(16),
                                        style:
                                            AppTextStyles.Fourteen600TextBlack,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.foodService.allOrdersList
                                        .elementAt(orderIndex)
                                        .cartList!
                                        .elementAt(0)
                                        .time!
                                        .toDate()
                                        .toIso8601String(),
                                    style: AppTextStyles.Fourteen500TextAsh,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: sizeFit(false, 20, context),
                                onBackgroundImageError: (_, __) {
                                  const Icon(Icons.info);
                                  debugPrint(__.toString());
                                },
                                backgroundImage: CachedNetworkImageProvider(
                                    controller.foodService.allOrdersList
                                        .elementAt(orderIndex)
                                        .clientPhoto!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: sizeFit(false, 10, context),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizeFit(true, 8, context)),
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: sizeFit(false, 35, context),
                                        onBackgroundImageError: (_, __) {
                                          const Icon(Icons.info);
                                          debugPrint(__.toString());
                                        },
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                controller
                                                    .foodService.allOrdersList
                                                    .elementAt(orderIndex)
                                                    .cartList!
                                                    .elementAt(index)
                                                    .foodImage!),
                                      ),
                                      SizedBox(
                                        width: sizeFit(true, 220, context),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .foodService.allOrdersList
                                                  .elementAt(orderIndex)
                                                  .cartList!
                                                  .elementAt(index)
                                                  .foodName!,
                                              style: AppTextStyles
                                                  .Fourteen600TextBlack,
                                            ),
                                            Text(
                                              controller
                                                  .foodService.allOrdersList
                                                  .elementAt(orderIndex)
                                                  .cartList!
                                                  .elementAt(index)
                                                  .foodDescription!,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles
                                                  .Fourteen400TextAsh,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'NGN${controller.foodService.allOrdersList.elementAt(orderIndex).cartList!.elementAt(index).foodPrice!}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppTextStyles
                                                      .Fourteen600TextBlack,
                                                ),
                                                Text(
                                                  'Qty: ${controller.foodService.allOrdersList.elementAt(orderIndex).cartList!.elementAt(index).quantity}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppTextStyles
                                                      .Fourteen600TextBlack,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: AppDarkColors.AppAsh,
                                    indent: sizeFit(true, 65, context),
                                  );
                                },
                                itemCount: controller.foodService.allOrdersList
                                    .elementAt(orderIndex)
                                    .cartList!
                                    .length),
                          ),
                          const Divider(
                            color: AppDarkColors.AppAsh,
                          ),
                          Offstage(
                            offstage: controller.foodService.allOrdersList
                                    .elementAt(orderIndex)
                                    .status ==
                                'success',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'X${controller.foodService.allOrdersList.elementAt(orderIndex).cartList!.length} items',
                                      style: AppTextStyles.Fourteen400TextAsh,
                                    ),
                                    Text(
                                      'NGN ${controller.foodService.allOrdersList.elementAt(orderIndex).total}',
                                      style: AppTextStyles.Fourteen600TextBlack,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ActionButton(
                                      action: 'accept',
                                      onTap: () {
                                        controller.updateOrderStatus(
                                            orderModel: controller
                                                .foodService.pendingOrdersList
                                                .elementAt(orderIndex),
                                            status: 'success');
                                      },
                                    ),
                                    SizedBox(
                                      width: sizeFit(true, 16, context),
                                    ),
                                    ActionButton(
                                      action: 'cancel',
                                      onTap: () {
                                        controller.updateOrderStatus(
                                            orderModel: controller
                                                .foodService.pendingOrdersList
                                                .elementAt(orderIndex),
                                            status: 'cancelled');
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: controller.foodService.allOrdersList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: sizeFit(false, 16, context),
                );
              },
            );
    });
  }
}
