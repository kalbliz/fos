import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/progress.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/rider_home_controller.dart';

class RiderHomeView extends GetView<RiderHomeController> {
  const RiderHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Obx(() {
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: controller.cameraPosition,
                  mapToolbarEnabled: false,
                  onMapCreated: controller.onMapCreated,
                  zoomControlsEnabled: false,
                  // mapType: MapType.terrain,
                  markers: controller.markers.value,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: sizeFit(false, 20, context),
                      left: sizeFit(true, 16, context),
                    ),
                    height: sizeFit(false, 65, context),
                    decoration: BoxDecoration(
                      color: AppColors.AppBackgroundWhite.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => controller.toggleViewState.value ==
                                ViewState.busy
                            ? Center(
                                child: Row(
                                  children: [
                                    const CircularProgressIndicator(
                                      backgroundColor: AppColors
                                          .AppCircularProgressLightBlue,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.AppLightBlue,
                                      ),
                                      strokeWidth: 2,
                                    ),
                                    SizedBox(
                                      width: sizeFit(true, 12, context),
                                    ),
                                    Text(controller.switchStatus.value
                                        ? 'Going offline...'
                                        : 'Going online...'),
                                  ],
                                ),
                              )
                            : FlutterSwitch(
                                onToggle: (bool value) async {},
                                width: sizeFit(true, 42, context),
                                height: sizeFit(false, 26, context),
                                valueFontSize: sizeFit(false, 16, context),
                                toggleSize: sizeFit(false, 24, context),
                                value: controller.switchStatus.value,
                                borderRadius: sizeFit(false, 22, context),
                                activeColor: AppColors.AppSwitchGreen,
                                padding: 0.7,
                                showOnOff: false,
                              )),
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Get.find<DeliveryService>().isRiderInTransit.value
                //       ? Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             ConfirmDeliveryButton(
                //               onTap: () async {
                //                 await controller.updateDeliveryStatus(
                //                     'DELIVERED', false);
                //               },
                //             ),
                //             SizedBox(
                //               height: sizeFit(false, 32, context),
                //             ),
                //           ],
                //         )
                //       : SizedBox(
                //           height: sizeFit(false, 235, context),
                //           child: controller.deliveryRequestsViewState.value ==
                //                   ViewState.busy
                //               ? const ProgressWidget()
                //               : Offstage(
                //                   offstage: controller.toggleViewState.value ==
                //                       ViewState.busy,
                //                   child: Padding(
                //                     padding: EdgeInsets.symmetric(
                //                       horizontal: sizeFit(true, 8, context),
                //                       vertical: 8,
                //                     ),
                //                     child: controller.requests.data!.isEmpty
                //                         ? SizedBox()
                //                         : ListView.separated(
                //                             shrinkWrap: true,
                //                             physics:
                //                                 const ClampingScrollPhysics(),
                //                             scrollDirection: Axis.horizontal,
                //                             itemCount: controller
                //                                 .requests.data!.length,
                //                             separatorBuilder: (context, index) {
                //                               return SizedBox(
                //                                 width:
                //                                     sizeFit(true, 8, context),
                //                               );
                //                             },
                //                             itemBuilder: (context, index) {
                //                               return IncomingDeliveryRequest(
                //                                   index: index);
                //                             }),
                //                   ),
                //                 ),
                //         ),
                // ),
              ],
            );
          }),
        ),
      ),
    );
  }
}