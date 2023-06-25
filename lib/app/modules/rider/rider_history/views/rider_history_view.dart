import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rider_history_controller.dart';

class RiderHistoryView extends GetView<RiderHistoryController> {
  const RiderHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiderHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiderHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
