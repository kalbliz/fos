import 'package:fos/app/routes/app_pages.dart';
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
  int onBoard = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    _box = GetStorage();
    super.onInit();
  }
   Future<String> initialRoute() async {
    late String route;
    _box.writeIfNull('onBoarded', 0);
    onBoard = await _box.read('onBoarded');

    if (onBoard == 0) {
      _box.write('onBoarded', 1);
      route = Routes.ONBOARD;
    } else {
      route = Routes.LOGIN;
    }
    return route;
  }
}
