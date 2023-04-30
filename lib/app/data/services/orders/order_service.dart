import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class OrderServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<OrderModel> orderList = <OrderModel>[].obs;


  Future getOrderList() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orderList')
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapshot(e)).toList();

      orderList.clear();
      for (var element in responseData) {
        orderList.add(element);
      }
      orderList.sort(((a, b) {
        return Comparable.compare(
            a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      }));
    });
  }

  
}
