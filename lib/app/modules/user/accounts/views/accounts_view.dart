import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppDarkColors.AppPrimaryWhite,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 30, context),
                vertical: sizeFit(false, 34, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        controller.authService.userPhoto),
                    radius: sizeFit(false, 50, context),
                  ),
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Information',
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(false, 8, context),
                          vertical: sizeFit(false, 4, context)),
                      decoration: BoxDecoration(
                          color: AppDarkColors.AppYellow,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Online',
                        style: AppTextStyles.Sixteen400White,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: AppTextStyles.Fourteen500TextAsh,
                    ),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    Text(
                      controller.authService.userName.capitalize!,
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Phone Number',
                      style: AppTextStyles.Fourteen500TextAsh,
                    ),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    Text(
                      controller.authService.userPhoneNumber.capitalize!,
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Email ',
                      style: AppTextStyles.Fourteen500TextAsh,
                    ),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    Text(
                      controller.authService.userEmail.capitalize!,
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Address',
                      style: AppTextStyles.Fourteen500TextAsh,
                    ),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    Text(
                      controller.authService.userAddress.capitalize!,
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeFit(false, 16, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of orders',
                      style: AppTextStyles.Fourteen500TextAsh,
                    ),
                    SizedBox(
                      height: sizeFit(false, 4, context),
                    ),
                    Text(
                      controller.orderService.orderList.length.toString(),
                      style: AppTextStyles.Eighteen600TextBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
