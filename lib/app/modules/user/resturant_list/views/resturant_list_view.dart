import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_list_controller.dart';

class ResturantListView extends GetView<ResturantListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurents in your location'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeFit(true, 31, context)),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    debugPrint(index.toString());
                    Get.toNamed(Routes.RESTURANT_DETAILS, arguments: [
                      {"index": index},
                    ]);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: sizeFit(false, 150, context),
                          width: sizeFit(true, 314, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(controller
                                      .foodServices
                                      .foodMenus[index]
                                      .foodImage!))),
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 8, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.foodServices.foodMenus[index]
                                    .foodName!.capitalize!,
                                style: AppTextStyles.Sixteen400TextBlack,
                              ),
                              SizedBox(
                                height: sizeFit(false, 1, context),
                              ),
                              Text(
                                controller.foodServices.foodMenus[index]
                                    .resturantName!.capitalize!,
                                style: AppTextStyles.Fourteen400TextAsh,
                              ),
                              SizedBox(
                                height: sizeFit(false, 1, context),
                              ),
                              Text(
                                'location goes here',
                                style: AppTextStyles.Fourteen400TextAsh,
                              ),
                              SizedBox(
                                height: sizeFit(false, 1, context),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: sizeFit(false, 18, context),
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.zero,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star_rounded,
                                  color: AppDarkColors.AppPrimaryPink,
                                  size: sizeFit(false, 15, context),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: sizeFit(false, 1, context),
                              ),
                              Text(
                                '20% off ',
                                style: AppTextStyles.Fourteen400TextAsh,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: sizeFit(false, 24, context),
                );
              },
              itemCount: 6),
        )));
  }
}
