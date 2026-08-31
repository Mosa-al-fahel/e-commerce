import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  Myservices myservices = Get.find();
  loGout() {
    myservices.sharedPreferences.clear();
    Get.toNamed(AppRoute.login);
  }
}
