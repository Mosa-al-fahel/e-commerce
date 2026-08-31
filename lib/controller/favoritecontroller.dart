import 'package:app/core/constant/colors.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/favoritaddandremove.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Myservices myservices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];

  Map isFavorite = {};
  setFav(itemsid, favorite) {
    isFavorite[itemsid] = favorite;
    update();
  }

  addfavorite(itemsId) async {
    data.clear();
    var response = await favoriteData.addFavorite(
        myservices.sharedPreferences.getString("id")!, itemsId.toString());

    if (response["status"] == "success") {
      Get.rawSnackbar(
          backgroundColor: Appcolors.blue,
          titleText: const Text("notefication",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          messageText: const Text("add to favorite done",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white)));

      update();
    } else {
      Get.defaultDialog(
          title: "failed",
          middleText: " try later we will fix it later  ,welcom",
          onCancel: () {
            Get.back();
          });
    }
  }

  removefavorite(itemsId) async {
    data.clear();
    var response = await favoriteData.removeFavorite(
        myservices.sharedPreferences.getString("id")!, itemsId.toString());
    if (response["status"] == "success") {
      Get.rawSnackbar(
          backgroundColor: Appcolors.orange,
          titleText: const Text(
              textAlign: TextAlign.center,
              "notefication",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          messageText: const Text(
              textAlign: TextAlign.center,
              "remove from favorite done",
              style: TextStyle(fontSize: 20, color: Colors.white)));

      update();
    } else {
      Get.defaultDialog(
          title: "failed",
          middleText: " try later we will fix it later  ,welcom",
          onCancel: () {
            Get.back();
          });
    }
  }
}
