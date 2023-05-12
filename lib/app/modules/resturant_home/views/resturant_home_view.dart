import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_home_controller.dart';

class ResturantHomeView extends GetView<ResturantHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome ${controller.authService.userName.capitalize}'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.pageViewState.value == ViewState.busy
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 16, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ORDER LIST',
                        style: AppTextStyles.Eighteen600TextBlack,
                      ),
                      Obx(() {
                        return controller
                                .foodService.resturantOrdersList.isEmpty
                            ? Text('No Orders')
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sizeFit(true, 8, context),
                                          vertical: sizeFit(false, 8, context)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Order ID: #${controller.foodService.resturantOrdersList.elementAt(index).id}',
                                                    style: AppTextStyles
                                                        .Fourteen600TextBlack,
                                                  ),
                                                  Text(
                                                    controller.foodService
                                                        .resturantOrdersList
                                                        .elementAt(index)
                                                        .cartList!
                                                        .elementAt(0)
                                                        .time!
                                                        .toDate()
                                                        .toIso8601String(),
                                                    style: AppTextStyles
                                                        .Fourteen500TextAsh,
                                                  ),
                                                ],
                                              ),
                                              CircleAvatar(
                                                radius:
                                                    sizeFit(false, 20, context),
                                                onBackgroundImageError:
                                                    (_, __) {
                                                  const Icon(Icons.info);
                                                  debugPrint(__.toString());
                                                },
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        controller.foodService
                                                            .resturantOrdersList
                                                            .elementAt(index)
                                                            .clientPhoto!),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: sizeFit(false, 10, context),
                                          ),
                                          ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: sizeFit(
                                                          false, 20, context),
                                                      onBackgroundImageError:
                                                          (_, __) {
                                                        const Icon(Icons.info);
                                                        debugPrint(
                                                            __.toString());
                                                      },
                                                      backgroundImage:
                                                          CachedNetworkImageProvider(
                                                              controller
                                                                  .foodService
                                                                  .resturantOrdersList
                                                                  .elementAt(
                                                                      index)
                                                                  .cartList!
                                                                  .elementAt(
                                                                      index)
                                                                  .foodImage!),
                                                    )
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const Divider(
                                                  color:
                                                      AppDarkColors.AppTextAsh,
                                                );
                                              },
                                              itemCount: controller.foodService
                                                  .resturantOrdersList
                                                  .elementAt(index)
                                                  .cartList!
                                                  .length)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller
                                    .foodService.resturantOrdersList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: sizeFit(false, 16, context),
                                  );
                                },
                              );
                      }),
                    ],
                  ),
                ));
        }));
  }
}
