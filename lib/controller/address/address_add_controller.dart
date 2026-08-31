import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/addressdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdressAddController extends GetxController {
  AddressData addressdata = AddressData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Myservices myservices = Get.find();
  List data = [];
  TextEditingController? city;
  TextEditingController? name;
  TextEditingController? street;

  @override
  void onInit() {
    city = TextEditingController();
    name = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  goToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }

  addressAdd() async {
    update();
    var response = await addressdata.addData(
        myservices.sharedPreferences.getString('id')!,
        city!.text,
        street!.text,
        name!.text);
    if (response["status"] == "success") {
      Get.offAllNamed(AppRoute.homescreen);
      return Get.snackbar(
          "done", "now you can order and get orders on you address");
    } else {
      Get.dialog(const Text("sorry"));
    }
    update();
  }
}
