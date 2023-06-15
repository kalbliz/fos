import 'package:flutter/material.dart';
import 'package:fos/app/modules/resturant/rider/controllers/rider_controller.dart';
import 'package:fos/app/modules/resturant/rider/widgets/rider_details.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:get/get.dart';

class RidersView extends StatelessWidget {
  RidersView({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<RiderController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.ridersList.length,
      separatorBuilder: (context, index) {
        return const Divider(
          color: AppColors.AppLightGrey,
        );
      },
      itemBuilder: (context, index) {
        return RiderDetailsWidget(
            onTap: () {
              controller.selectRider(index);
              Get.toNamed(Routes.RIDER_DETAILS);
            },
            riderName: controller.ridersList[index].name!,
            riderPhoneNumber: controller.ridersList[index].phone!,
            riderEmail: controller.ridersList[index].email!,
            dateCreated: controller.ridersList[index].createdAt!,
            fleet: controller.ridersList[index].address!,
            status: controller.ridersList[index].active == 0
                ? 'OFFLINE'
                : 'ONLINE');
      },
    );
  }
}
