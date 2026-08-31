import 'package:app/controller/homapage_controller.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/offers.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersItemsController extends SearchMixContaroller {
  @override
  Myservices myservices = Get.find();
  List<ItemsModel> data = [];
  OffersData offersdata = OffersData(Get.find());
  late bool isshow ;

  getOfersItems() async {
    isshow = true;
    data.clear();
    var response = await offersdata.getdata();
    if (response["status"] == "success") {
      print(response["data"]);
      List offersdata = response["data"];
      data.addAll(offersdata.map((e) => ItemsModel.fromJson(e)));
      isshow = false;
      update();
    } else {
      Get.defaultDialog(
          title: "no data added",
          middleText: "try later welcom",
          onCancel: () {
            Get.back();
          });
    }
  }

  @override
  void onInit() {
    textController = TextEditingController();
    isshow = true;
    super.onInit();
    getOfersItems();
    print(data);
  }
}
