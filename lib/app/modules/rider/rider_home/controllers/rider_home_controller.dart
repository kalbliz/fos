import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/helpers/d.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class RiderHomeController extends GetxController {
  //TODO: Implement RiderHomeController
  late Uint8List markerIcon;
  final GlobalKey fabKey = GlobalKey();
  final count = 0.obs;
  final isShimmerLoading = false.obs;
  final visibility = true.obs;
  final switchStatus = false.obs;
  final switch1Status = false.obs;
  final switch2Status = false.obs;
  final switch3Status = false.obs;
  final onlineSwitchStatus = false.obs;
  final toggleViewState = ViewState.idle.obs;
  final deliveryRequestsViewState = ViewState.idle.obs;
  final getDirectionViewState = ViewState.idle.obs;
  final requestsViewState = ViewState.idle.obs;

  late MapController mapController;

  @override
  void onInit() {
    super.onInit();
    mapController = MapController(
      initMapWithUserPosition: true,
     
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
