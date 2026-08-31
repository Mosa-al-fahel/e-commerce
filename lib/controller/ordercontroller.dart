import 'package:app/core/constant/colors.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/orders/pendingdata.dart';
import 'package:app/data/model/ordersmodel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  late bool isshow;
  late BuildContext context;
  List<OrdersModel> data = [];
  PendingData pendingData = PendingData(Get.find());
  Myservices myservices = Get.find();
  String chooseorderpayment(String value) {
    if (value == "1") {
      return "card";
    } else {
      return "cash";
    }
  }

  String chooseorderRecive(String value) {
    if (value == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String printStatus(int value) {
    if (value == 0) {
      return "wait above";
    } else if (value == 1) {
      return "prepare";
    } else if (value == 2) {
      return "Ready to pick up by Delivery";
    } else if (value == 3) {
      return "on the way";
    }
    return "archive";
  }

  String chooseorderStatus(String value) {
    if (value == "0") {
      return "wait above";
    } else if (value == '2') {
      return "preparing..";
    } else {
      return "contac us";
    }
  }

  getOrdersData() async {
    update();
    data.clear();

    var response = await pendingData
        .getOrdersdata(myservices.sharedPreferences.getString("id")!);

    if (response["status"] == "success") {
      List listData = response['data'];
      print(
          "/n \n mosa mosa mosa mosa mosa mosa mosa mosa mosa======== $listData  +++++++++mosa mosa mosa mosa mosa \n mosa mosa msoa ");
      data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      update();
      isshow = false;
      update();
    } else {
      Get.defaultDialog(
          title: "no data added",
          middleText: "try later welcom",
          onCancel: () {
            Get.back();
          });
      isshow = false;
      update();
    }
  }

  deleteorder(String orderid) async {
    isshow = true;
    update();
    var response = await pendingData.deleteOrdersdata(orderid);
    if (response["status"] == "success") {
      isshow = false;
      Get.rawSnackbar(
          backgroundColor: Appcolors.grey2,
          titleText: const Text(
              textAlign: TextAlign.center,
              "succes",
              style: TextStyle(
                  fontSize: 22,
                  color: Appcolors.white,
                  fontWeight: FontWeight.bold)),
          messageText: const Text(
              textAlign: TextAlign.center,
              "deleted from cart done",
              style: TextStyle(fontSize: 20, color: Appcolors.white)));
      update();
    } else {
      isshow = false;
      AwesomeDialog(
        transitionAnimationDuration: Durations.long1,
        //      barrierColor: Color.fromARGB(219, 81, 119, 255),

        headerAnimationLoop: false,

        dismissOnBackKeyPress: true,
        btnOkColor: Appcolors.blue,
        dialogType: DialogType.error,
        body: Text(
          "sorry something went wrong",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 22, color: Appcolors.grey2),
        ),
        animType: AnimType.scale,
        context: context,
        btnOk: Text(
          "will be fixed later",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        btnCancelColor: Appcolors.blue,
        btnOkOnPress: () {},
      ).show();
    }
    update();
  }

  @override
  void onInit() {
    isshow = true;
    getOrdersData();
    super.onInit();
  }
}
