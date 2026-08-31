import 'package:app/core/constant/routes.dart';
import 'package:app/data/datasource/remote/forgetpasswordd/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  checkemail();

  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckEmailData checkemaildata = CheckEmailData(Get.find());
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      var response = await checkemaildata.postdata(email.text);
      if (response["status"] == "success") {
        Get.toNamed(AppRoute.verifycode, arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "sorry",
            middleText: "email not found",
            onCancel: () {
              Get.back();
            });
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
