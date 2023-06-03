import 'dart:io' as io;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/edit_food_controller.dart';

class EditFoodView extends GetView<EditFoodController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppGrey,
        appBar: AppBar(
          backgroundColor: AppColors.AppGrey,
          title: Text('Edit Food'),
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
                            horizontal: sizeFit(true, 16, context)),
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
                                        ? CachedNetworkImageProvider(controller
                                            .foodServices.foodFromResturant
                                            .elementAt(controller
                                                .foodServices.foodFromResturant
                                                .indexWhere((element) =>
                                                    element.id ==
                                                    controller.id))
                                            .foodImage!)
                                        : FileImage(File(controller.file.value))
                                            as ImageProvider,
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
                                  .validate()) {
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
