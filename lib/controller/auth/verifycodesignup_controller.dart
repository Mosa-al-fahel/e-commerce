import 'package:app/core/constant/routes.dart';
import 'package:app/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifycodeSignUpController extends GetxController {
  checkCode();
  goTosuccessignup(String verfiycode);
  reSendCode();
}

class VerifycodeSignUpControllerImp extends VerifycodeSignUpController {
  VerfiyCodeSignUpData verfiycodesignupdata = VerfiyCodeSignUpData(Get.find());
  late String? email;
  @override
  checkCode() {}

  @override
  goTosuccessignup(String verfiycode) async {
    var response = await verfiycodesignupdata.postdata(email!, verfiycode);
    if (response["status"] == "success") {
      Get.toNamed(AppRoute.successignup);
    } else {
      Get.defaultDialog(
          title: "wait",
          middleText: "you enter wrong verfiycode",
          onCancel: () {
            Get.back();
          });
    }

    // Get.toNamed(AppRoute.successignup);
  }

  @override
  reSendCode() {
    verfiycodesignupdata.reSendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
