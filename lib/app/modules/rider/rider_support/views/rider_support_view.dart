import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:fos/app/utilities/helpers/launcher_functions.dart';
import 'package:fos/app/utilities/loader/progress.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';

import 'package:get/get.dart';

import '../controllers/rider_support_controller.dart';

class RiderSupportView extends GetView<RiderSupportController> {
  const RiderSupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.AppLightGrey,
        body: SafeArea(
          child: Obx(() {
            return controller.pageViewState.value == ViewState.busy
                ? ProgressWidget()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeFit(true, 16, context),
                          vertical: sizeFit(false, 32, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.AppBackgroundWhite,
                            radius: sizeFit(false, 75, context),
                            child: Image.asset(
                              'assets/images/nav/support_image.png',
                              scale: 5,
                            ),
                          ),
                          SizedBox(
                            height: sizeFit(false, 32, context),
                          ),
                          Twenty600AppBlack(text: 'Support 24/7'),
                          SizedBox(
                            height: sizeFit(false, 8, context),
                          ),
                          Fourteen400AppGreyNun(
                            text:
                                'You can send payment invoice to sender or mark as paid if the shipment has been paid for!',
                            alignment: TextAlign.center,
                          ),
                          SizedBox(
                            height: sizeFit(false, 52, context),
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            tileColor: AppColors.AppBackgroundWhite,
                            leading: Image.asset(
                              'assets/images/nav/messages.png',
                              scale: 4,
                            ),
                            title: Sixteen400AppBlack(
                              text: 'Chat with Administrator',
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: sizeFit(false, 16, context),
                              color: AppColors.AppBlack,
                            ),
                            onTap: () {
                              controller.authService.supportWhatsApp == ''
                                  ? makeLocalPhoneCall(
                                      controller.authService.supportPhoneNumber)
                                  : whatsappLaunchUrl(
                                      controller.authService.supportWhatsApp);
                            },
                          ),
                          SizedBox(
                            height: sizeFit(false, 16, context),
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            tileColor: AppColors.AppBackgroundWhite,
                            leading: Image.asset(
                              'assets/images/nav/call.png',
                              scale: 4,
                            ),
                            title: Sixteen400AppBlack(
                              text: 'Call Administrator',
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: sizeFit(false, 16, context),
                              color: AppColors.AppBlack,
                            ),
                            onTap: () {
                              makeLocalPhoneCall(
                                  controller.authService.supportPhoneNumber);
                            },
                          )
                        ],
                      ),
                    ),
                  );
          }),
        ));
  }
}
