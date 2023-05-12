import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/modules/nav/controllers/nav_controller.dart';
import 'package:fos/app/routes/app_pages.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';

class GeneralDialog {
  Future<dynamic> circularLoader() {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => true,
        child: const Center(
          child: CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(appYellow),
              ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  //   errorMessage(String message) {
  //   return Get.defaultDialog(
  //     backgroundColor: AppDarkColors.AppGrey,
  //     // onWillPop: () async => false,
  //     title: 'Error',
  //     titleStyle: const TextStyle(
  //       color: AppDarkColors.AppRed,
  //       fontFamily: "DMSans",
  //     ),
  //     content: Text(
  //       message,
  //       textAlign: TextAlign.center,
  //       //  TODO: Add styling for errors.
  //       style: const TextStyle(
  //         color: AppDarkColors.AppBackgroundWhite,
  //         fontFamily: "DMSans",
  //       ),
  //     ),
  //     titlePadding: const EdgeInsets.all(8.0),
  //     contentPadding:
  //         const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
  //   );
  // }

  Future<dynamic> successMessage(String title, String message) {
    return Get.defaultDialog(
      // onWillPop: () async => false,
      backgroundColor: AppDarkColors.AppAsh,
      title: title.capitalizeFirst!,
      titleStyle: const TextStyle(
        color: AppDarkColors.AppPrimaryPink,
        fontFamily: "DMSans",
      ),
      content: Text(
        message.capitalizeFirst!,
        textAlign: TextAlign.center,
        //  TODO: Add styling for errors.
        style: const TextStyle(
          color: AppDarkColors.AppPrimaryWhite,
          fontFamily: "DMSans",
        ),
      ),
      titlePadding: const EdgeInsets.all(8.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  showDialog(BuildContext context, String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title.capitalizeFirst!,
          style: const TextStyle(
            color: AppDarkColors.AppPrimaryPink,
            fontFamily: "Nunito",
          ),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text("MAY BE"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  successCupertinoMessage(String message) {
    return showCupertinoDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'Success!',
          style: TextStyle(
            color: AppDarkColors.AppPrimaryPink,
            fontFamily: "Nunito",
          ),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Nunito",
            color: AppDarkColors.AppPrimaryBlack,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              "Dismiss",
              style: TextStyle(
                  fontFamily: "Nunito", color: AppDarkColors.AppPrimaryBlack),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          // CupertinoDialogAction(
          //   child: Text("CANCEL"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          // CupertinoDialogAction(
          //   child: Text("MAY BE"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }

  foodUploadSuccessCupertinoMessage(String message) {
    return showCupertinoDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'Success!',
          style: TextStyle(
            color: AppDarkColors.AppPrimaryPink,
            fontFamily: "Nunito",
          ),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Nunito",
            color: AppDarkColors.AppPrimaryBlack,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              "Dismiss",
              style: TextStyle(
                  fontFamily: "Nunito", color: AppDarkColors.AppPrimaryBlack),
            ),
            onPressed: () {
              // Get.offAllNamed(Routes.NAV);
              // NavController().tabIndex.value = 0;
              Get.back();
            },
          ),
          // CupertinoDialogAction(
          //   child: Text("CANCEL"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          // CupertinoDialogAction(
          //   child: Text("MAY BE"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }

  twoActionsDialog(
      BuildContext context,
      String title,
      String message,
      String firstAction,
      String secondAction,
      void Function()? actionOne,
      void Function()? actionTwo) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title.capitalizeFirst!,
          style: TextStyle(
              color: AppDarkColors.AppPrimaryBlack,
              fontFamily: "Nunito",
              fontSize: sizeFit(false, 16, context),
              fontWeight: FontWeight.w500),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(
              color: AppDarkColors.AppAsh,
              fontFamily: "Nunito",
              fontSize: sizeFit(false, 14, context),
              fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: actionOne,
            child: Text(
              firstAction,
              style: TextStyle(
                  color: AppDarkColors.AppPrimaryBlack,
                  fontFamily: "Nunito",
                  fontSize: sizeFit(false, 16, context),
                  fontWeight: FontWeight.w500),
            ),
          ),
          CupertinoDialogAction(
            onPressed: actionTwo,
            // ignore: sort_child_properties_last
            child: Text(
              secondAction,
              style: TextStyle(
                  color: AppDarkColors.AppPrimaryBlack,
                  fontFamily: "Nunito",
                  fontSize: sizeFit(false, 16, context),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  errorMessage(String message) {
    return showCupertinoDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(
            color: AppDarkColors.AppRed,
            fontFamily: "Nunito",
          ),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Nunito",
            color: AppDarkColors.AppPrimaryBlack,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              "Dismiss",
              style: TextStyle(
                  fontFamily: "Nunito", color: AppDarkColors.AppPrimaryBlack),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          // CupertinoDialogAction(
          //   child: Text("CANCEL"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          // CupertinoDialogAction(
          //   child: Text("MAY BE"),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }

  infoMessage(String message, List<Widget> actions) {
    return showCupertinoDialog(
      context: Get.context!,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          'Check your mail',
          style: TextStyle(
            color: AppDarkColors.AppPrimaryBlack,
            fontFamily: "Nunito",
          ),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Nunito",
            color: AppDarkColors.AppPrimaryBlack,
          ),
        ),
        actions: actions,
      ),
    );
  }
}
