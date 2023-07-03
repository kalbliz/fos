// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:fos/app/utilities/helpers/open_googel_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/helpers/d.dart';
import 'package:fos/app/utilities/helpers/launcher_functions.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

class RiderHomeController extends GetxController {
  //TODO: Implement RiderHomeController
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
  final confirmDeliveryViewState = ViewState.idle.obs;
  late Uint8List markerIcon;
  RxSet<Marker> markers = <Marker>{}.obs;
  final Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();

  late GoogleMapController mapController;
  late StreamSubscription<Position> positionStream;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final riderServices = Get.find<RiderServices>();
  final authServices = Get.find<AuthService>();
  Future<Position?> _determinePosition() async {
    bool? serviceEnabled;
    Position? position;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Geolocator.openAppSettings();
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
    } catch (e) {
      position = null;
    }
    return position;
    // Test if location services are enabled.
    permission = await Geolocator.checkPermission();
  }

  void onMapCreated(GoogleMapController controller) async {
    mapCompleter.complete(controller);
    mapController = await mapCompleter.future;
    Position? position = await _determinePosition();
    if (position != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15.7,
          ),
        ),
      );
      markerIcon =
          await getBytesFromAsset('assets/images/home/map_marker.png', 110);
      final Marker riderMarker = Marker(
        anchor: const Offset(0.5, 1.0),
        zIndex: 4.0,
        markerId: const MarkerId(''),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(position.latitude, position.longitude),
        // infoWindow: const InfoWindow(title: 'fullname'),
      );
      markers.clear();
      markers.add(riderMarker);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getRiderRequests();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getRiderRequests() async {
    deliveryRequestsViewState.value = ViewState.busy;
    debugPrint('making request for orders');
    await riderServices
        .getRiderOrders(riderName: authServices.userName)
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    debugPrint(' request for orders ended');
    deliveryRequestsViewState.value = ViewState.idle;
  }

  void increment() => count.value++;
  void setSelectedRequestIndex(int index) {
    Get.find<RiderServices>().selectedOrderIndex = index;
  }

  Future rejectOrder() async {
    deliveryRequestsViewState.value = ViewState.busy;
    await riderServices
        .rejectOrder(
            orderId: riderServices.riderOrders
                .elementAt(riderServices.selectedOrderIndex)
                .id,
            status: 'cancelled')
        .then((value) async {
      await riderServices.getRiderOrders(riderName: authServices.userName);
      GeneralDialog().successCupertinoMessage('Delivery Rejected');
    }).catchError((onError) {
      throw onError;
    });
    deliveryRequestsViewState.value = ViewState.idle;
  }

  Future acceptOrder() async {
    deliveryRequestsViewState.value = ViewState.busy;
    await riderServices
        .updateRiderOrders(
            orderId: riderServices.riderOrders
                .elementAt(riderServices.selectedOrderIndex)
                .id,
            status: 'transit')
        .then((value) async {
      await riderServices.getRiderOrders(riderName: authServices.userName);
    }).catchError((onError) {
      throw onError;
    });
    deliveryRequestsViewState.value = ViewState.idle;
  }

  Future confirmDelivery() async {
    confirmDeliveryViewState.value = ViewState.busy;
    await riderServices
        .updateRiderOrders(
            orderId: riderServices.riderOrders
                .elementAt(riderServices.selectedOrderIndex)
                .id,
            status: 'completed')
        .then((value) async {
      riderServices.isRiderInTransit.value = false;
      await riderServices.getRiderOrders(riderName: authServices.userName);
      GeneralDialog().successCupertinoMessage('Delivery Successful');
    }).catchError((onError) {
      throw onError;
    });
    confirmDeliveryViewState.value = ViewState.idle;
  }

  Future<List<Location>> getCordinates({required String address}) async {
    List<Location> cordinate = await locationFromAddress(address);
    return cordinate;
  }

  Future getDeliveryDirection() async {
    getDirectionViewState.value = ViewState.busy;
    riderServices.isRiderInTransit.value = false;
    await getCordinates(
            address: Get.find<RiderServices>()
                .riderOrders
                .elementAt(Get.find<RiderServices>().selectedOrderIndex)
                .clientLocation!)
        .then((cordinates) {
      showCupertinoDialog(
        context: Get.context!,
        builder: (context) => OpenDestinationWidget(
          cordinates: cordinates,
        ),
      );
    }).catchError((onError) {
      throw onError;
    });
    getDirectionViewState.value = ViewState.idle;
  }
}
