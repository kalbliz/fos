import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/create_food/widget/categories.dart';
import 'package:fos/app/modules/user/home/controllers/home_controller.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/create_food_controller.dart';

class CreateFoodView extends GetView<CreateFoodController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppBackgroundWhite,
        appBar: AppBar(
          backgroundColor: AppColors.AppBackgroundWhite,
          title: Text('Create Food'),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.pageState.value == ViewState.busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 16, context),
                            vertical: sizeFit(false, 8, context)),
                        child: Form(
                          key: controller.foodFormKey,
                          child: Column(
                            children: [
                              Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: CircleAvatar(
                                    radius: sizeFit(false, 50, context),
                                    backgroundColor:
                                        AppDarkColors.AppPrimaryPink,
                                    backgroundImage: controller.file.value == ''
                                        ? null
                                        : FileImage(
                                            File(controller.file.value)),
                                    child: controller.file.value == ''
                                        ? Icon(
                                            Icons.add_photo_alternate,
                                            size: sizeFit(false, 30, context),
                                            color:
                                                AppDarkColors.AppPrimaryWhite,
                                          )
                                        : null,
                                  ),
                                );
                              }),
                              SizedBox(
                                height: sizeFit(false, 16, context),
                              ),
                              SizedBox(
                                width: sizeFit(true, 300, context),
                                child: FosTextFieldWidget(
                                  hintText: 'Enter Food Name',
                                  textEditingController:
                                      controller.foodTitleEditingController,
                                  validator: controller.foodTitleValidator,
                                ),
                              ),
                              SizedBox(
                                height: sizeFit(false, 16, context),
                              ),
                              SizedBox(
                                width: sizeFit(true, 300, context),
                                child: FosTextFieldWidget(
                                  hintText: 'Describe the Food',
                                  textEditingController: controller
                                      .foodDescriptionEditingController,
                                  validator:
                                      controller.foodDescriptionValidator,
                                ),
                              ),
                              SizedBox(
                                height: sizeFit(false, 16, context),
                              ),
                              SizedBox(
                                width: sizeFit(true, 300, context),
                                child: FosTextFieldWidget(
                                  hintText: 'Set Food Price in Naira',
                                  textEditingController:
                                      controller.foodPriceEditingController,
                                  validator: controller.foodPriceValidator,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              controller.foodServices.categories.isEmpty
                                  ? SizedBox(
                                      child: Text('no categorise'),
                                    )
                                  : Obx(() {
                                      return ChipsChoice<String>.multiple(
                                          choiceStyle: C2ChipStyle.filled(
                                              color: AppDarkColors.AppAsh,
                                              selectedStyle: C2ChipStyle.filled(
                                                  color: AppDarkColors
                                                      .AppPrimaryPink)),
                                          onChanged: (List<String> value) {
                                            controller.selectedCategories
                                                .value = value;

                                            print(
                                                controller.selectedCategories);
                                          },
                                          value: controller
                                              .selectedCategories.value,
                                          choiceItems: C2Choice.listFrom(
                                              source: controller
                                                  .foodServices.categories
                                                  .map((element) =>
                                                      element.categoryName!)
                                                  .toList(),
                                              value: (i, v) => v,
                                              label: (i, v) => v));
                                    })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: sizeFit(false, 10, context)),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AuthButton(
                            title: 'Upload Food',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (controller.foodFormKey.currentState!
                                      .validate() &&
                                  controller.file.value != '') {
                                controller.uploadFoodDetails();
                              }
                            },
                          )),
                    )
                  ],
                );
        }));
  }
}
