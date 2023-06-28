import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_personal_details_controller.dart';

class RiderPersonalDetailsView extends GetView<RiderPersonalDetailsController> {
  const RiderPersonalDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiderPersonalDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiderPersonalDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
