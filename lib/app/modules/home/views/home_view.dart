// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/loader/image_loader.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:sidebarx/sidebarx.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarX(
        controller: controller.sidebarController,
        footerItems: [
          SidebarXItem(
              icon: Icons.exit_to_app_outlined, label: 'Log Out', onTap: () {})
        ],
        showToggleButton: false,
        separatorBuilder: (context, index) {
          return Divider(
            color: AppDarkColors.AppPrimaryWhite,
            indent: sizeFit(true, 15, context),
            endIndent: sizeFit(true, 15, context),
          );
        },
        extendedTheme: SidebarXTheme(textStyle: AppTextStyles.Sixteen400White),
        theme: SidebarXTheme(
            padding:
                EdgeInsets.symmetric(vertical: sizeFit(false, 50, context)),
            width: sizeFit(true, 100, context),
            selectedIconTheme: IconThemeData(
              color: AppDarkColors.AppPrimaryWhite,
            ),
            iconTheme: IconThemeData(
              color: AppDarkColors.AppPrimaryWhite,
            ),
            textStyle: AppTextStyles.Sixteen400White,
            decoration: BoxDecoration(color: AppDarkColors.AppPrimaryPink)),
        items: [
          SidebarXItem(
              icon: Icons.add_circle_outline, label: 'Add Food', onTap: () {}),
          SidebarXItem(
              icon: Icons.add_circle_outline, label: 'Add Food', onTap: () {}),
        ],
      ),
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
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
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
                        height: sizeFit(false, 24, context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 16, context)),
                        child: Text(
                          'Popular Resturants',
                          style: AppTextStyles.TwentyFour500TextBlack,
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 16, context),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: sizeFit(true, 16, context)),
                        child: SizedBox(
                          height: sizeFit(false, 120, context),
                          child: ListView.separated(
                            itemCount:
                                controller.foodServices.resturantsList.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            controller: controller.resturantsScrollController,
                            itemBuilder: (context, index) {
                              return ResturantAvatar(
                                index: index,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: sizeFit(true, 12, context),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 24, context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizeFit(true, 16, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'In your location',
                              style: AppTextStyles.Twenty600TextBlack,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.RESTURANT_LIST);
                              },
                              child: Text(
                                'see all',
                                style: AppTextStyles.Fourteen400TextPink,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeFit(false, 16, context),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: sizeFit(true, 16, context)),
                        child: SizedBox(
                          height: sizeFit(false, 230, context),
                          child: ListView.separated(
                            itemCount: controller.foodServices.foodMenus.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            controller: controller.resturantsScrollController,
                            itemBuilder: (context, index) {
                              return ResturantInLocationAvatar(
                                index: index,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: sizeFit(true, 12, context),
                              );
                            },
                          ),
                        ),
                      ),
                      // AuthButton(
                      //   title: 'Log Out',
                      //   onTap: () {
                      //     // controller.firebaseAuth.signOut().then((response) {
                      //     //   Get.offAllNamed(Routes.LOGIN);
                      //     // });
                      //     controller.getMenus();
                      //   },
                      // )
                    ],
                  ),
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

class ResturantAvatar extends StatelessWidget {
  final HomeController controller = HomeController();
  final int index;
  ResturantAvatar({
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: sizeFit(false, 90, context),
              width: sizeFit(true, 100, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(controller
                          .foodServices.resturantsList[index].userPhoto!))),
            ),
          ),
          SizedBox(
            height: sizeFit(false, 4, context),
          ),
          Text(
            controller.foodServices.resturantsList[index].userName!.capitalize!,
            style: AppTextStyles.Sixteen400TextBlack,
          )
        ],
      ),
    );
  }
}

class ResturantInLocationAvatar extends StatelessWidget {
  final HomeController controller = HomeController();
  final int index;
  ResturantInLocationAvatar({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: sizeFit(false, 120, context),
              width: sizeFit(true, 256, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(controller
                          .foodServices.foodMenus[index].foodImage!))),
            ),
          ),
          SizedBox(
            height: sizeFit(false, 1, context),
          ),
          Text(
            controller.foodServices.foodMenus[index].foodName!.capitalize!,
            style: AppTextStyles.Sixteen400TextBlack,
          ),
          SizedBox(
            height: sizeFit(false, 1, context),
          ),
          Text(
            controller.foodServices.foodMenus[index].sellerName!.capitalize!,
            style: AppTextStyles.Fourteen400TextAsh,
          ),
          SizedBox(
            height: sizeFit(false, 1, context),
          ),
          Text(
            'location goes here',
            style: AppTextStyles.Fourteen400TextAsh,
          ),
          SizedBox(
            height: sizeFit(false, 1, context),
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: sizeFit(false, 18, context),
            itemCount: 5,
            ignoreGestures: true,
            itemPadding: EdgeInsets.zero,
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: AppDarkColors.AppPrimaryPink,
              size: sizeFit(false, 15, context),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }
}
