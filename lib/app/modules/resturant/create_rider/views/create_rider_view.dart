import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/loader/progress.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/create_rider_controller.dart';

class CreateRiderView extends GetView<CreateRiderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Rider'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.pageState.value == ViewState.busy
              ? const ProgressWidget()
              : SingleChildScrollView(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 16, context),
                          vertical: sizeFit(false, 24, context),
                        ),
                        child: Form(
                          key: controller.createRider,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Eighteen600AppBlack(
                                  text: 'Rider’s information'),
                              SizedBox(
                                height: sizeFit(false, 16, context),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.getImage();
                                },
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Obx(() {
                                      return InkWell(
                                        onTap: () {
                                          controller.getImage();
                                        },
                                        child: CircleAvatar(
                                          radius: sizeFit(false, 40, context),
                                          backgroundColor:
                                              AppDarkColors.AppPrimaryPink,
                                          backgroundImage: controller
                                                      .file.value ==
                                                  ''
                                              ? null
                                              : FileImage(
                                                  File(controller.file.value)),
                                          child: controller.file.value == ''
                                              ? Icon(
                                                  Icons.add_photo_alternate,
                                                  size: sizeFit(
                                                      false, 30, context),
                                                  color: AppDarkColors
                                                      .AppPrimaryWhite,
                                                )
                                              : null,
                                        ),
                                      );
                                    }),
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      height: sizeFit(false, 30, context),
                                      decoration: BoxDecoration(
                                        color: AppColors.AppBackgroundWhite,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.AppLightGrey),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.AppBackgroundBlue,
                                        size: sizeFit(false, 10, context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeFit(false, 24, context),
                              ),
                              //name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FosTextFieldWidget(
                                    hintText: 'eg. Your name',
                                    textEditingController:
                                        controller.nameEditingController,
                                    maxLines: 1,
                                    titleText: 'Name',
                                    validator: controller.nameValidator,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: sizeFit(false, 24, context),
                              ),
                              //phone number
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FosTextFieldWidget(
                                    hintText: 'eg. +234 9978 77546',
                                    titleText: 'Phone Number',
                                    textEditingController:
                                        controller.phoneEditingController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11)
                                    ],
                                    textInputType: TextInputType.number,
                                    validator: controller.phoneValidator,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: sizeFit(false, 24, context),
                              ),
                              //email
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FosTextFieldWidget(
                                    hintText: 'eg. email@mail.com',
                                    maxLines: 1,
                                    titleText: 'Email',
                                    textEditingController:
                                        controller.emailEditingController,
                                    textInputType: TextInputType.emailAddress,
                                    validator: controller.emailValidator,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: sizeFit(false, 24, context),
                              ),
//Address
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FosTextFieldWidget(
                                    titleText: 'Address',
                                    maxLines: 4,
                                    textInputType: TextInputType.multiline,
                                    hintText: 'eg. rider address goes here',
                                    textEditingController:
                                        controller.addressEditingController,
                                    validator:
                                        controller.senderAddressValidator,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: sizeFit(false, 80, context),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: sizeFit(false, 10, context),
                          ),
                          child: AuthButton(
                              title: 'Create Rider',
                              onTap: () {
                                if (controller.createRider.currentState!
                                    .validate()  &&
                                  controller.file.value != '') {
                                  controller.uploadFoodDetails();
                                }else{
                                GeneralDialog().errorMessage('Rider image is required');
                                }
                              }),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
