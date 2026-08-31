import 'package:app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccesResetPaawordController extends GetxController {
  goToLoginPage();
}

class SuccesResetPaawordControllerImp extends SuccesResetPaawordController {
  @override
  goToLoginPage() {
    Get.offAllNamed(AppRoute.login);
  }
}
