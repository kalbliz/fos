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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: sizeFit(false, 110, context),
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
            ),
            Container(
              height: sizeFit(false, 200, context),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/home/banner.jpg'))),
              child: Column(
                children: [],
              ),
            )
          ],
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
        CircleAvatar(
          radius: sizeFit(false, 45, context),
          backgroundImage: AssetImage('assets/images/home/burger.jpg'),
        ),
        Text(
          'Burgers',
          style: AppTextStyles.Fourteen400TextAsh,
        )
      ],
    );
  }
}
