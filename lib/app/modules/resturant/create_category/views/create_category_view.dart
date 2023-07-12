import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/create_category_controller.dart';

class CreateCategoryView extends GetView<CreateCategoryController> {
  const CreateCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Category'),
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
                                  hintText: 'Enter Category Name',
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
                                  hintText: 'Describe this Category',
                                  textEditingController: controller
                                      .foodDescriptionEditingController,
                                  validator:
                                      controller.foodDescriptionValidator,
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
                            title: 'Create Category',
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
