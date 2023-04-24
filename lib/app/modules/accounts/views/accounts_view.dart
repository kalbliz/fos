import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppDarkColors.AppAsh,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeFit(true, 30, context),
                vertical: sizeFit(false, 24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: sizeFit(false, 45, context),
                ),
                Text('Amrita joshi'),
                Text('Oakhla, New Delhi'),
                SizedBox(
                  height: sizeFit(false, 10, context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 28, context),
                      vertical: sizeFit(false, 20, context)),
                  decoration: BoxDecoration(
                      color: AppDarkColors.AppPrimaryWhite,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: sizeFit(false, 22, context),
                            color: AppDarkColors.AppPrimaryPink,
                          ),
                          SizedBox(
                            width: sizeFit(true, 8, context),
                          ),
                          Text('Amrita Joshi')
                        ],
                      ),
                      SizedBox(
                        height: sizeFit(false, 8, context),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: sizeFit(false, 22, context),
                            color: AppDarkColors.AppPrimaryPink,
                          ),
                          SizedBox(
                            width: sizeFit(true, 8, context),
                          ),
                          Text('Amritajoshi@gmail.com')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
