import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_profile_controller.dart';

class RiderProfileView extends GetView<RiderProfileController> {
  const RiderProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiderProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiderProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
