import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: Text('Hey Tobias'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeFit(false, 120, context),
                child: ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 110,
                  physics: BouncingScrollPhysics(),
                  controller: controller.resturantsScrollController,
                  itemBuilder: (context, index) {
                    return Rest();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Rest extends StatelessWidget {
  const Rest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/home/pizza.png',
          height: sizeFit(false, 100, context),
          fit: BoxFit.cover,
        ),
        Text(
          'Burgers',
          style: AppTextStyles.Fourteen400TextAsh,
        )
      ],
    );
  }
}
