import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_rider_controller.dart';

class CreateRiderView extends GetView<CreateRiderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateRiderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateRiderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
