import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:google_fonts/google_fonts.dart';

class RiderDetailsWidget extends StatelessWidget {
  final String riderName;
  final String riderPhoneNumber;
  final String riderEmail;
  final String dateCreated;
  final String fleet;
  final String status;
  final void Function() onTap;

  const RiderDetailsWidget({
    Key? key,
    required this.onTap,
    required this.riderName,
    required this.riderPhoneNumber,
    required this.riderEmail,
    required this.dateCreated,
    required this.fleet,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: sizeFit(true, 8, context),
          vertical: sizeFit(false, 12, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Fourteen500AppGreyNun(text: 'Rider’s Name'),
                Fourteen500AppBlackNun(text: riderName)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //phone number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Phone'),
                Fourteen500AppBlackNun(text: riderPhoneNumber)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //email
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Email'),
                Fourteen500AppBlackNun(text: riderEmail)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //Date created
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Date created'),
                Fourteen500AppBlackNun(text: dateCreated)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //fleet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Fleet'),
                Fourteen500AppBlackNun(text: fleet)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Fourteen500AppGreyNun(text: 'Status'),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 4, context),
                      vertical: sizeFit(false, 2, context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: status == 'ONLINE'
                        ? AppColors.AppLightGreen
                        : status == 'OFFLINE'
                            ? AppColors.AppBackgroundRed
                            : AppColors.AppLightGrey,
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.nunito(
                      color: status == 'ONLINE'
                          ? AppColors.AppGreen
                          : status == 'OFFLINE'
                              ? AppColors.AppRedText
                              : AppColors.AppAsh,
                      fontWeight: FontWeight.w600,
                      fontSize: sizeFit(false, 12, context),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
