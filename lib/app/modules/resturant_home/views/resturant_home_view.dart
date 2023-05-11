import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

import 'package:get/get.dart';

import '../controllers/resturant_home_controller.dart';

class ResturantHomeView extends GetView<ResturantHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            ListTile(
              leading: CircleAvatar(
                backgroundImage: const CachedNetworkImageProvider(
                  '',
                ),
                onBackgroundImageError: (_, __) {
                  Icon(
                    Icons.info,
                    color: AppDarkColors.AppTextAsh,
                    size: sizeFit(false, 22, context),
                  );
                },
              ),
            );
          },
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: sizeFit(false, 16, context),
            );
          },
        ),
      ],
    )));
  }
}
