import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resturant_profile_controller.dart';

class ResturantProfileView extends GetView<ResturantProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResturantProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResturantProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
