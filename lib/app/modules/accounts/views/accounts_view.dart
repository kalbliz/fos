import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccountsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
