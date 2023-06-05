import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import 'package:get/get.dart';

import '../controllers/resturant_order_detail_controller.dart';

class ResturantOrderDetailView extends GetView<ResturantOrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 16, context),
                vertical: sizeFit(false, 10, context)),
            child: Column(
              children: [
                Row(
                  children: [
                    const Fourteen600AppBlackNun(
                      text: 'DropOff Details',
                    ),
                    SizedBox(
                      width: sizeFit(true, 16, context),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 4, context),
                          vertical: sizeFit(false, 4, context)),
                      decoration: BoxDecoration(color: AppColors.AppAsh),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
