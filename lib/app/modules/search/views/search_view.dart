import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: Text('Search for the food you want'),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.pageState.value == ViewState.busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizeFit(true, 16, context)),
                    child: Column(
                      children: [
                        Form(
                          key: controller.foodFormKey,
                          child: Column(
                            children: [
                              FosTextFieldWidget(
                                textEditingController:
                                    controller.searchTextEditingController,
                                hintText: '',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: AppDarkColors.AppPrimaryPink,
                                    size: sizeFit(false, 20, context),
                                  ),
                                  onPressed: () {
                                    controller.searchFood();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: sizeFit(false, 36, context),
                        ),
                        Obx(() {
                          return controller.searchMenu.isEmpty
                              ? Text('Sorry There is no food with that name')
                              : GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.searchMenu.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.FOOD_DETAILS,
                                            arguments: [
                                              {"index": index},
                                            ]);
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            radius: sizeFit(false, 60, context),
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    controller.searchMenu[index]
                                                        .foodImage!),
                                          ),
                                          SizedBox(
                                            height: sizeFit(false, 4, context),
                                          ),
                                          Text(
                                            controller.searchMenu[index]
                                                .foodName!.capitalize!,
                                            style: AppTextStyles
                                                .Sixteen400TextBlack,
                                          )
                                        ],
                                      ),
                                    );
                                  });
                        })
                      ],
                    ),
                  ),
                );
        }));
  }
}
