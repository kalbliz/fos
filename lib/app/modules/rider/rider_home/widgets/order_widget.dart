import 'package:flutter/cupertino.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/fourteens.dart';
import 'package:get/get.dart';

class OrderDetailsWidget extends StatelessWidget {
  final int index;

  const OrderDetailsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final selectedDeliveryItem =
        Get.find<RiderServices>().riderOrders.first.cartList!.elementAt(index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Fourteen400AppBackgroundBlueNun(text: 'Item ${index + 1}'),
            Fourteen400AppBlackNun(text: '${selectedDeliveryItem.foodName}')
          ],
        ),
        SizedBox(
          height: sizeFit(false, 8, context),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Fourteen400AppGreyMont(text: 'Resturant'),
          Fourteen400AppBlackNun(text: '${selectedDeliveryItem.resturantName}'),
        ]),
        SizedBox(
          height: sizeFit(false, 8, context),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Fourteen400AppGreyMont(text: 'Quantity'),
          Fourteen400AppBlackNun(text: '${selectedDeliveryItem.quantity}'),
        ]),
        SizedBox(
          height: sizeFit(false, 8, context),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Fourteen400AppGreyMont(text: 'Value'),
          Fourteen400AppBlackNun(text: '₦${selectedDeliveryItem.foodPrice}'),
        ]),
        SizedBox(
          height: sizeFit(false, 8, context),
        ),
      ],
    );
  }
}
