import 'package:app/core/constant/routes.dart';
import 'package:app/data/datasource/remote/forgetpasswordd/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetpasswordController extends GetxController {
  forgetPassword();
  goToSuccefulResetPassword();
  securepassword();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  GlobalKey<FormState> formstate = GlobalKey();
  bool isshow = true;

  @override
  securepassword() {
    isshow = isshow == false ? true : false;
    update();
  }

  @override
  forgetPassword() {}

  @override
  goToSuccefulResetPassword() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(
          title: "Warning",
          middleText: "the first password must being same the second",
          onCancel: () {
            Get.back();
          });
    }
    if (formstate.currentState!.validate()) {
      var response = await resetPasswordData.postdata(password.text, email!);
      if (response["status"] == "success") {
        Get.toNamed(
          AppRoute.succefulresetpassword,
        );
      } else {
        Get.defaultDialog(
            title: "sorry",
            middleText: "some thing went wrong try again",
            onCancel: () {
              Get.back();
            });
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
