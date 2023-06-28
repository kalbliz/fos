import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_settings_controller.dart';

class RiderSettingsView extends GetView<RiderSettingsController> {
  const RiderSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiderSettingsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiderSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
