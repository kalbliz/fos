import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/loader/progress.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/resturant_profile_controller.dart';

class ResturantProfileView extends GetView<ResturantProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppBackgroundWhite,
      appBar: AppBar(
        leadingWidth: sizeFit(true, 75, context),
        title: InkWell(
            onTap: () {}, child: const Eighteen500AppBlack(text: 'Profile')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.AppBackgroundWhite,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.thisViewState.value == ViewState.busy
              ? ProgressWidget()
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 16, context),
                          vertical: sizeFit(false, 24, context),
                        ),
                        child: Column(children: [
                          ImageLoaderWidget(
                            imageUrl: controller.authService.userPhoto ??
                                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                            radius: sizeFit(false, 50, context),
                          ),
                          SizedBox(
                            height: sizeFit(false, 16, context),
                          ),
                          Twenty600AppBlack(
                              text: controller.authService.userName!),
                          SizedBox(
                            height: sizeFit(false, 8, context),
                          ),
                          Fourteen400AppGreyMont(
                              text: controller.authService.userPhoneNumber!),
                          SizedBox(
                            height: sizeFit(false, 50, context),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: controller.menuList[index].onTap,
                                  leading: Image.asset(
                                    controller.menuList[index].imagePath,
                                    scale: 4,
                                  ),
                                  title: controller.menuList[index].title ==
                                          'Log out'
                                      ? Sixteen400AppRed(
                                          text:
                                              controller.menuList[index].title)
                                      : Sixteen400AppBlack(
                                          text:
                                              controller.menuList[index].title),
                                  trailing: controller.menuList[index].title ==
                                          'Log out'
                                      ? SizedBox()
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.AppBlack,
                                          size: sizeFit(false, 18, context),
                                        ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: AppColors.AppLightGrey,
                                );
                              },
                              itemCount: controller.menuList.length),
                        ]),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
