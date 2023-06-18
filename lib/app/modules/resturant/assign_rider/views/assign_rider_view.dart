import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:fos/app/utilities/loader/progress.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:fos/app/utilities/textfield/fob_formfield.dart';

import 'package:get/get.dart';

import '../controllers/assign_rider_controller.dart';

class AssignRiderView extends GetView<AssignRiderController> {
  const AssignRiderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Rider'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.addNewRiderViewState.value == ViewState.busy
              ? const ProgressWidget()
              : SingleChildScrollView(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 16, context)),
                        child: Column(
                          children: [
                            ListView.separated(
                                shrinkWrap: true,
                                controller: controller.scrollController,
                                physics: controller.scrollPhysics,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      // controller.riderIndex.value = index;
                                      // Get.toNamed(Routes.RIDER_NOTE);
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: sizeFit(false, 20, context),
                                          backgroundImage:
                                              CachedNetworkImageProvider(controller
                                                      .riderServices.riders
                                                      .elementAt(index)
                                                      .photo ??
                                                  'https://res.cloudinary.com/tailor/image/upload/v1672439014/user.png'),
                                        ),
                                        SizedBox(
                                          width: sizeFit(true, 8, context),
                                        ),
                                        Fourteen500AppBlackNun(
                                            text: controller
                                                .riderServices.riders
                                                .elementAt(index)
                                                .name!
                                                .capitalize!)
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: sizeFit(false, 16, context),
                                  );
                                },
                                itemCount:
                                    controller.riderServices.riders.length)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
