import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/modules/rider/rider_home/widgets/incoming_request.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
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
                  alignment: Alignment.bottomCenter,
                  child: Get.find<RiderServices>().isRiderInTransit.value ==
                          true
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConfirmDeliveryButton(
                              isIdle:
                                  controller.confirmDeliveryViewState.value ==
                                      ViewState.idle,
                              onTap: () async {
                                await controller.confirmDelivery();
                              },
                            ),
                            SizedBox(
                              height: sizeFit(false, 32, context),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: sizeFit(false, 235, context),
                          child: controller.deliveryRequestsViewState.value ==
                                  ViewState.busy
                              ? const ProgressWidget()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: sizeFit(true, 8, context),
                                    vertical: 8,
                                  ),
                                  child: controller
                                          .riderServices.riderOrders.isEmpty
                                      ? const SizedBox()
                                      : ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .riderServices.riderOrders.length,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: sizeFit(true, 8, context),
                                            );
                                          },
                                          itemBuilder: (context, index) {
                                            return IncomingDeliveryRequest(
                                                index: index);
                                          }),
                                ),
                        ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
