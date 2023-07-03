import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:google_fonts/google_fonts.dart';

class ShipmentDetailsWidget extends StatelessWidget {
  final String orderid;
  final String customer;
  final String noOfparcel;
  final String status;
  final String price;
  final String paymentStatus;
  final String date;
  final String fleet;
  final void Function() onTap;

  const ShipmentDetailsWidget({
    Key? key,
    required this.orderid,
    required this.customer,
    required this.noOfparcel,
    required this.status,
    required this.price,
    required this.paymentStatus,
    required this.date,
    required this.fleet,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sizeFit(true, 8, context),
            vertical: sizeFit(false, 12, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order id
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Fourteen500AppGreyNun(text: 'Order ID No.'),
                Fourteen500AppBlackNun(text: orderid)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //customer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Customer'),
                Fourteen500AppBlackNun(text: customer)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'No of parcel(s)'),
                Fourteen500AppBlackNun(text: noOfparcel)
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
                    color: status == 'pending'
                        ? AppColors.AppBackgroundYellow
                        : status == 'transit'
                            ? AppColors.AppOrangeBackground
                            : status == 'cancelled'
                                ? AppColors.AppBackgroundYellow
                                : status == 'completed'
                                    ? AppColors.AppLightGreen
                                    : AppColors.AppPink,
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: GoogleFonts.nunito(
                        color: status == 'pending'
                            ? AppColors.AppYellow
                            : status == ' transit'
                                ? AppColors.AppOrange
                                : status == 'cancelled'
                                    ? AppColors.AppYellow
                                    : status == 'completed'
                                        ? AppColors.AppGreen
                                        : AppColors.AppRed,
                        fontWeight: FontWeight.w600,
                        fontSize: sizeFit(false, 12, context)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Price'),
                Fourteen500AppBlackNun(text: 'NGN$price')
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //Payment status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Fourteen500AppGreyNun(text: 'Payment status'),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 4, context),
                      vertical: sizeFit(false, 2, context)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: paymentStatus == 'PAID'
                          ? AppColors.AppLightGreen
                          : status == 'UNPAID'
                              ? AppColors.AppBackgroundYellow
                              : AppColors.AppPink),
                  child: Text(
                    paymentStatus,
                    style: GoogleFonts.nunito(
                        color: paymentStatus == 'PAID'
                            ? AppColors.AppGreen
                            : status == 'UNPAID'
                                ? AppColors.AppYellow
                                : AppColors.AppRed,
                        fontWeight: FontWeight.w600,
                        fontSize: sizeFit(false, 12, context)),
                  ),
                )
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
                Fourteen500AppBlackNun(text: date)
              ],
            ),
            SizedBox(
              height: sizeFit(false, 8, context),
            ),
            //Date created
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Fourteen500AppGreyNun(text: 'Resturant'),
                Fourteen500AppBlackNun(text: fleet)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
