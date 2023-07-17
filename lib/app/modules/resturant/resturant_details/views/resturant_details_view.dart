import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_details_controller.dart';

class ResturantDetailsView extends GetView<ResturantDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.resturantName,
            style: AppTextStyles.TwentySix400TextPink //TextStyle
            ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: sizeFit(false, 200, context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      controller.foodServices.resturantsList
                          .elementAt(controller.resturantIndex)
                          .userPhoto!,
                    ),
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 8, context),
                          vertical: sizeFit(false, 4, context)),
                      decoration: BoxDecoration(
                          color: AppDarkColors.AppPrimaryBlack,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        controller.foodServices.resturantsList
                            .elementAt(controller.resturantIndex)
                            .userAddress!,
                        style: AppTextStyles.Twelve400White,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text('Returant Menu', style: AppTextStyles.Eighteen600TextBlack),
            Obx(() {
              return controller.pageViewState.value == ViewState.busy
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : controller.foodServices.foodFromResturant.isEmpty
                      ? const Center(
                          child: Text('There is no food available'),
                        )
                      : GridView.builder(
                          controller: ScrollController(),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: sizeFit(false, 24, context)),
                          itemCount:
                              controller.foodServices.foodFromResturant.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: sizeFit(false, 140, context),
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.FOOD_DETAILS, arguments: [
                                  {
                                    "id": controller.foodServices
                                        .foodFromResturant[index].id!
                                  },
                                ]);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: sizeFit(false, 40, context),
                                    backgroundImage: CachedNetworkImageProvider(
                                        controller
                                            .foodServices
                                            .foodFromResturant[index]
                                            .foodImage!),
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 4, context),
                                  ),
                                  Text(
                                    controller
                                        .foodServices
                                        .foodFromResturant[index]
                                        .foodName!
                                        .capitalize!,
                                    style: AppTextStyles.Sixteen400TextBlack,
                                  ),
                                  SizedBox(
                                    height: sizeFit(false, 2, context),
                                  ),
                                  Text(
                                    ' NGN${controller.foodServices.foodFromResturant[index].foodPrice!.toString()}',
                                    style: AppTextStyles.Fourteen400TextPink,
                                  ),
                                ],
                              ),
                            );
                          });
            }),
            SizedBox(
              height: sizeFit(false, 160, context),
            )
          ],
        ),
      )),
    );
  }
}
