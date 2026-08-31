import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassowrd();
  securepassword();
}

class LogincontrollerImp extends LoginController {
  LoignData logindata = LoignData(Get.find());
  late TextEditingController email;
  late TextEditingController password;
  Myservices myservices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshow = true;
  @override
  login() async {
    if (formstate.currentState!.validate()) {
      var response = await logindata.postdata(password.text, email.text);
      if (response["status"] == "success") {
        if (response['data']['users_approve'] == 1) {
          myservices.sharedPreferences
              .setString("id", response["data"]["users_id"].toString());

          myservices.sharedPreferences
              .setString("password", response["data"]["users_password"]);

          myservices.sharedPreferences
              .setString("username", response["data"]["users_name"]);
          

          myservices.sharedPreferences
              .setString("email", response["data"]["users_email"]);
          myservices.sharedPreferences.setString("step", "2");

          Get.toNamed(AppRoute.homescreen);
        } else {
          Get.toNamed(AppRoute.verifysocesignup,
              arguments: {"email": email.text});
        }
      } else {
        Get.defaultDialog(
            title: "sorry",
            middleText:
                "your email & password once of them or both not correct",
            onCancel: () {
              Get.back();
            });
      }
    }
  }

  @override
  securepassword() {
    isshow = isshow == false ? true : false;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  goToForgetPassowrd() {
    Get.toNamed(AppRoute.forgetpassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
