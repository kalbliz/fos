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
                                  // return Card(
                                  //   child: ListTile(
                                  //     leading: CircleAvatar(
                                  //       backgroundImage:
                                  //           CachedNetworkImageProvider(
                                  //         controller
                                  //             .foodService.resturantOrdersList
                                  //             .elementAt(index)
                                  //             .clientName,
                                  //       ),
                                  //       onBackgroundImageError: (_, __) {
                                  //         Icon(
                                  //           Icons.info,
                                  //           color: AppDarkColors.AppTextAsh,
                                  //           size: sizeFit(false, 22, context),
                                  //         );
                                  //       },
                                  //     ),
                                  //   ),
                                  // );
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
                      AuthButton(
                        title: 'Refresh Order',
                        onTap: () {
                          controller.getresturantOrders();
                        },
                      )
                    ],
                  ),
                ));
        }));
  }
}
