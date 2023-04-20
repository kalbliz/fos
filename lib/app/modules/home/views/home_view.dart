// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:get/get.dart';

import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: Text('Hey ${controller.authService.userName.capitalize}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.pageViewState.value == ViewState.busy
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizeFit(false, 110, context),
                      child: ListView.builder(
                        itemCount: controller.foodServices.foodMenus.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 90,
                        physics: BouncingScrollPhysics(),
                        controller: controller.resturantsScrollController,
                        itemBuilder: (context, index) {
                          return FoodAvatar(
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: sizeFit(false, 16, context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 16, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: sizeFit(false, 200, context),
                            padding: EdgeInsets.symmetric(
                                vertical: sizeFit(false, 12, context),
                                horizontal: sizeFit(true, 16, context)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/home/banner.jpg'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Get',
                                  style: AppTextStyles.TwentySix400TextWhite,
                                ),
                                Text(
                                  '50% off ',
                                  style: AppTextStyles.TwentySix400TextPink,
                                ),
                                Text(
                                  'your first meal!!',
                                  style: AppTextStyles.TwentySix400TextWhite,
                                ),
                                SizedBox(
                                  height: sizeFit(false, 12, context),
                                ),
                                SizedBox(
                                    width: sizeFit(true, 150, context),
                                    child: AuthButton(
                                        title: 'Order Now', onTap: () {}))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeFit(false, 32, context),
                    ),
                    AuthButton(
                      title: 'Log Out',
                      onTap: () {
                        // controller.firebaseAuth.signOut().then((response) {
                        //   Get.offAllNamed(Routes.LOGIN);
                        // });
                        controller.getFoodMeuns();
                      },
                    )
                  ],
                );
        }),
      ),
    );
  }
}

class FoodAvatar extends StatelessWidget {
  final HomeController controller = HomeController();
  final int index;
  FoodAvatar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.FOOD_DETAILS, arguments: [
          {"index": index},
        ]);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: sizeFit(false, 40, context),
            backgroundImage: CachedNetworkImageProvider(
                controller.foodServices.foodMenus[index].foodImage!),
          ),
          SizedBox(
            height: sizeFit(false, 4, context),
          ),
          Text(
            controller.foodServices.foodMenus[index].foodName!.capitalize!,
            style: AppTextStyles.Sixteen400TextBlack,
          )
        ],
      ),
    );
  }
}
