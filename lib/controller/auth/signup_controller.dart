import 'package:app/core/constant/routes.dart';
import 'package:app/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
  securepassword();
}

class SignUpcontrollerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phonenumber;
  late TextEditingController username;
  SignupData signupdata = SignupData(Get.find());
  bool isshow = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  securepassword() {
    isshow = isshow == false ? true : false;
    update();
  }

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      var response = await signupdata.postdata(
          username.text, password.text, email.text, phonenumber.text);
      if (response["status"] == "success") {
        Get.toNamed(AppRoute.homescreen, arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "sorry",
            middleText:
                "there is wrong data  maybe the email and number are exits already",
            onCancel: () {
              Get.back();
            });
      }

      Get.delete<SignUpcontrollerImp>();
    }
    update();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoute.login);
    Get.delete<SignUpcontrollerImp>();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phonenumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phonenumber.dispose();
    super.dispose();
  }
}
