import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/helpers/launcher_functions.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class OpenDestinationWidget extends StatelessWidget {
  final List<Location> cordinates;
  const OpenDestinationWidget({
    Key? key,
    required this.cordinates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Open Destination In Map',
        style: TextStyle(
          color: AppColors.AppBlack,
          fontFamily: "Nunito",
          fontSize: sizeFit(false, 16, context),
          fontWeight: FontWeight.w700,
        ),
      ),
      content: SizedBox(
        height: sizeFit(false, 150, context),
        child: Center(
          child: SingleChildScrollView(
            child: CupertinoListTile(
              onTap: () {
                Get.back();
                openMap(
                  latitude: cordinates.first.latitude.toDouble(),
                  longitude: cordinates.first.longitude.toDouble(),
                );
              },
              leading: const Icon(
                Icons.north_east_rounded,
                size: 16,
                color: AppColors.AppBlack,
              ),
              leadingToTitle: 0,
              padding: EdgeInsets.zero,
              title: Text(
                'Open client location with google navigator',
                style: TextStyle(
                  color: AppDarkColors.AppPrimaryPink,
                  fontFamily: "Nunito",
                  fontSize: sizeFit(false, 13, context),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () => Get.back(),
          child: Text(
            'CANCEL',
            style: TextStyle(
              color: AppColors.AppBlack,
              fontFamily: "Nunito",
              fontSize: sizeFit(false, 16, context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
