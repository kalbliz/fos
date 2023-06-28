import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  late GetStorage _box;
  GetStorage get box => _box;
  String userID = '';
  String userEmail = '';
  String userName = '';
  String userPhoto = '';
  String userPhoneNumber = '';
  String userAddress = '';
  String status = '';
   String userState = '';
  double earnings = 0;
  String supportPhoneNumber = '+234 814 227 6406';
  String supportWhatsApp = '+234 814 227 6406';
  @override
  void onInit() {
    // TODO: implement onInit
    _box = GetStorage();
    super.onInit();
  }

  

  
}
