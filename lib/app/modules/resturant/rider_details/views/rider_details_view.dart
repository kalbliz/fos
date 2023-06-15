import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_details_controller.dart';

class RiderDetailsView extends GetView<RiderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RiderDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RiderDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
