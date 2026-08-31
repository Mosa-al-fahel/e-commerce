import 'package:app/data/datasource/remote/orders/details.dart';
import 'package:app/data/model/cartmodel.dart';
import 'package:app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderdetailsController extends GetxController {
  late OrdersModel detailsData;
  List<CartModel> listData = [];
  OrdersDetailsData ordersdetailsdata = OrdersDetailsData(Get.find());

  getData() async {
    var response =
        await ordersdetailsdata.getdata(detailsData.ordersId.toString());

    if (response["status"] == "success") {
      print("succcceeesss000+++++++++++++++++++");
      List data = response['data'];
      listData.addAll(data.map((e) => CartModel.fromJson(e)));
      update();
      print(response);
    } else {
      Get.dialog( Text("$response"));
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    detailsData = Get.arguments['listdata'];

    getData();
    print(detailsData);
  }
}
