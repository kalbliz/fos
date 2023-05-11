import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resturant_orders_controller.dart';

class ResturantOrdersView extends GetView<ResturantOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResturantOrdersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResturantOrdersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
