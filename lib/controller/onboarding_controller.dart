import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController {
  next();
  onpagechanged(int index);
}

class Onboardingcontrollerimp extends Onboardingcontroller {
  Myservices myservices = Get.find();

  late PageController pagecontroller;
  int currentpage = 0;
  @override
  next() {
    currentpage++;
    if (currentpage > Onboardinglist.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    }
    pagecontroller.animateToPage(currentpage,
        duration: const Duration(milliseconds: 220), curve: Curves.easeInCirc);
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();

    super.onInit();
  }
}
