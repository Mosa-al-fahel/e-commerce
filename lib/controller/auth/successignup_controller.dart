import 'package:app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccesSignUpController extends GetxController {
  goToLoginPage();
}

class SuccesSignUpControllerImp extends SuccesSignUpController {
  @override
  goToLoginPage() {
    Get.offAllNamed(AppRoute.login);
  }
}
