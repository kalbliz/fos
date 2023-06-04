import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resturant_order_detail_controller.dart';

class ResturantOrderDetailView extends GetView<ResturantOrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResturantOrderDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResturantOrderDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
