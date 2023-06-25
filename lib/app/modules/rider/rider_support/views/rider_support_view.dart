import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_support_controller.dart';

class RiderSupportView extends GetView<RiderSupportController> {
  const RiderSupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiderSupportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiderSupportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
