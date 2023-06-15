import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:get/get.dart';

class RiderServices extends GetxService {
  int selectedRiderIndex = 0;

  Future saveRider(RiderData riderData) async {
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('riders');

      await ridersCollection
          .doc(riderData.id.toString())
          .set(riderData.toJson());

      print('Rider data saved successfully!');
    } catch (e) {
      print('Error saving rider data: $e');
    }
  }

  Future<List<RiderData>> getAllRiders() async {
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('riders');

      final QuerySnapshot snapshot = await ridersCollection.get();

      final List<RiderData> riders = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return RiderData.fromJson(data);
      }).toList();

      return riders;
    } catch (e) {
      print('Error retrieving riders data: $e');
      return [];
    }
  }
}
