import 'package:app/core/constant/routes.dart';
import 'package:app/data/datasource/remote/forgetpasswordd/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifycodeController extends GetxController {
  goToResetpassword(String verificationCode);
  reSendCode();
}

class VerifycodeControllerImp extends VerifycodeController {
  VerifyCodeForgetPasswordData verifycodeforgetpassworddata =
      VerifyCodeForgetPasswordData(Get.find());
  String? email;
  @override
  goToResetpassword(String verificationCode) async {
    var response =
        await verifycodeforgetpassworddata.postdata(email!, verificationCode);
    if (response["status"] == "success") {
      Get.toNamed(AppRoute.resetpassword, arguments: {"email": email});
    } else {
      Get.defaultDialog(
          title: "wait",
          middleText: "you enter wrong verfiycode",
          onCancel: () {
            Get.back();
          });
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  reSendCode() async {
    await verifycodeforgetpassworddata.resetCode(email!);
  }
}
