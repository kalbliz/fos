// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/resturant_home/widgets/singleOrder.dart';
import 'package:get/get.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

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
                return SingleOrderWidget(
                  orderList: controller.foodService.allOrdersList,
                  orderIndex: orderIndex,
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
