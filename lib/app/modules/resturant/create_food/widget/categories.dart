// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:fos/app/modules/resturant/create_food/controllers/create_food_controller.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

class IndividualCategory extends StatefulWidget {
  IndividualCategory({super.key, required this.index, this.value = false});
  final int index;
  bool? value;
  @override
  State<IndividualCategory> createState() => _IndividualCategoryState();
}

class _IndividualCategoryState extends State<IndividualCategory> {
  final controller = Get.find<CreateFoodController>();
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: sizeFit(false, 2, context),
          horizontal: sizeFit(true, 24, context)),
      value: widget.value,
      onChanged: (value) {
        widget.value = value;
        if (value == true) {
          controller.foodServices.categories
              .add(controller.foodServices.categories.elementAt(widget.index));
        } else {
          controller.foodServices.categories.remove(
              controller.foodServices.categories.elementAt(widget.index));
        }
        setState(() {});
      },
      activeColor: AppDarkColors.AppPrimaryPink,
      title: Text(controller.foodServices.categories
          .elementAt(widget.index)
          .categoryName!),
    );
  }
}
