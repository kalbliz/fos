import 'package:flutter/material.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';

import 'package:get/get.dart';

import '../controllers/rider_controller.dart';

class RiderView extends GetView<RiderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppGrey,
      appBar: AppBar(
        title: Text('Riders'),
        centerTitle: true,
        backgroundColor: AppColors.AppGrey,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.CREATE_RIDER);
        
      },child: Icon(Icons.add),),
      body: SafeArea(
        child:
        
        controller.riderViewState.value == ViewState.busy
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator.adaptive(),
              )
            :  Center(
          child: Text(
            'RiderView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
