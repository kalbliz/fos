import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_details_controller.dart';

class ResturantDetailsView extends GetView<ResturantDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppDarkColors.AppPrimaryWhite,
                  size: sizeFit(false, 24, context),
                )),
            backgroundColor: AppDarkColors.AppPrimaryBlack,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                  controller.foodServices.foodMenus[controller.index].foodName!,
                  style: AppTextStyles.TwentySix400TextWhite //TextStyle
                  ), //Text
              background: CachedNetworkImage(
                imageUrl: controller
                    .foodServices.foodMenus[controller.index].foodImage!,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: AppDarkColors.AppPrimaryBlack.withOpacity(0.35),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: AppDarkColors.AppAsh,
                  ),
                ),
              ),
            ),
            expandedHeight: 230,
          ),
          SliverPadding(
            padding:
                EdgeInsets.symmetric(vertical: sizeFit(false, 24, context)),
            sliver: SliverGrid.builder(
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.FOOD_DETAILS, arguments: [
                        {"index": index},
                      ]);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: sizeFit(false, 60, context),
                          backgroundImage: CachedNetworkImageProvider(controller
                              .foodServices.foodMenus[index].foodImage!),
                        ),
                        SizedBox(
                          height: sizeFit(false, 4, context),
                        ),
                        Text(
                          controller.foodServices.foodMenus[index].foodName!
                              .capitalize!,
                          style: AppTextStyles.Sixteen400TextBlack,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
