import 'package:app/core/constant/routes.dart';

import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/homedata.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMixContaroller {
  getData();
  List categoroies = [];
  List items = [];
  List setting = [];
  goItems(List listcategories, int selecteditem, catId);
  goToDetails(itemsmodel);
}

class HomePageControllerImp extends HomePageController {
   
  String? username;
  String? id;
  String? catId;
  bool? isshow;
  List images = [
    "laptop.png",
    "mobile.png",
    "food.png",
    "drink.png",
    "shoes.png"
  ];
  

  @override
  goItems(List listcategories, int selecteditem, catId) {
    Get.toNamed(AppRoute.items, arguments: {
      "listcatigories": listcategories,
      "selecteditem": selecteditem,
      "categoryid": catId
    });
    update();
  }

  @override
  getData() async {
    var response = await homedata.getdata();
    if (response["status"] == "success") {
      categoroies.addAll(response["categories"]['data']);
      items.addAll(response["items"]['data']);
      setting.addAll(response['setting']['data']);
      print(response);

      isshow = true;
    } else {
      Get.defaultDialog(
          title: "data is not ok",
          middleText: "try again or check internet",
          onCancel: () {
            Get.back();
          });
    }
    update();
  }

  @override
  void onInit() {
    textController = TextEditingController();
    isshow = false;
    getData();
    update();

    super.onInit();
  }

  @override
  goToDetails(itemsmodel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsmodel});
  }
}

class SearchMixContaroller extends GetxController {
  HomeData homedata = HomeData(Get.find());
  Myservices myservices = Get.find();
  TextEditingController? textController;
  bool issearch = false;
  List<ItemsModel> listItemsSearch = [];
  checkSearch(val) {
    if (val == "") {
      issearch = false;
      update();
    }
  }

  searchdone() {
    if (textController!.text == "") {
      return null;
    } else {
      issearch = true;
      searchResult();
      update();
    }
  }

  searchResult() async {
    var response = await homedata.searchitems(textController!.text);

    if (response["status"] == "success") {
      listItemsSearch.clear();

      List responsedata = response["data"];
      listItemsSearch.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
    } else {
      Get.defaultDialog(
          title: "this product is unavailable now",
          middleText: "later will be",
          onCancel: () {
            issearch = false;

            Get.back();
          });
    }
    update();
  }

  @override
  void onInit() {
    //   FirebaseMessaging.instance.subscribeToTopic("users");
    // var token = FirebaseMessaging.instance.getToken().then((value) {
    //   print('value : $value');
    // });

    textController = TextEditingController();

    super.onInit();
  }
}
