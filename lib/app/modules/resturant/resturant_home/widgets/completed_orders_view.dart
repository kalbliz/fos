import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:get/get.dart';

import 'singleOrder.dart';

class CompletedOrdersView extends StatelessWidget {
  CompletedOrdersView({super.key});
  final controller = Get.find<ResturantHomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.foodService.completedOrdersList.isEmpty
          ? Center(child: Text('No Completed Orders'))
          : ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int orderIndex) {
                return SingleOrderWidget(
                     orderList: controller.foodService.completedOrdersList,
                  orderIndex: orderIndex,
                );
              },
              itemCount: controller.foodService.completedOrdersList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: sizeFit(false, 16, context),
                );
              },
            );
    });
  }
}
