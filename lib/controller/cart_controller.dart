import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/cartdata.dart';
import 'package:app/data/model/cartmodel.dart';
import 'package:app/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> data = [];
  int totalcountitems = 0;
  double priceorders = 0.0;
  Myservices myservices = Get.find();
  CartData cartData = CartData(Get.find());
  TextEditingController? couponcontroller;
  CouponModel? couponmodel;
  int disCountCoupon = 0;
  String? nameCoupon;
  String? couponId;
  int x = 0;

  goCheckOut() {
    if (data.isEmpty) return Get.snackbar("cart is empty", "add some items");

    Get.offNamed(AppRoute.chekcout, arguments: {
      "couponid": couponId ?? "0",
      "priceorder": priceorders.toString(),
      "coupondiscount": disCountCoupon.toString()
    });
  }

  getFinalPrice() {
    return priceorders = priceorders - priceorders * disCountCoupon / 100;
  }

  fanDiscount() {
    return disCountCoupon = couponmodel!.couponDiscount!;
  }

  cartview() async {
    data.clear();
    var response =
        await cartData.cartview(myservices.sharedPreferences.getString("id")!);
    if (response["status"] == "success") {
      if (response['datacart']['status'] == 'success') {
        List dataresponse = response["datacart"]['data'];
        Map countandprice = response['countprice'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));

        totalcountitems = countandprice["totalcount"];
        priceorders = double.parse(countandprice["totalprice"].toString());
        update();
      }
    } else {
      Get.defaultDialog(
          title: "failed",
          middleText: "  false get count your items",
          onCancel: () {
            Get.back();
          });
    }
  }

  addcart(itemsId) async {
    var response = await cartData.cartadd(
        myservices.sharedPreferences.getString("id")!, itemsId.toString());

    if (response["status"] == "success") {
      Get.rawSnackbar(
          backgroundColor: Appcolors.black,
          titleText: const Text(
              textAlign: TextAlign.center,
              "succes",
              style: TextStyle(
                  fontSize: 22,
                  color: Appcolors.white,
                  fontWeight: FontWeight.bold)),
          messageText: const Text(
              textAlign: TextAlign.center,
              "add to cart done",
              style: TextStyle(fontSize: 20, color: Appcolors.white)));

      update();
    } else {
      Get.defaultDialog(
          title: "notifecation",
          middleText: " failed add to cart",
          onCancel: () {
            Get.back();
          });
    }
  }

  deletecart(itemsId) async {
    var response = await cartData.cartdelete(
        myservices.sharedPreferences.getString("id")!, itemsId.toString());
    if (response["status"] == "success") {
      Get.rawSnackbar(
          backgroundColor: Appcolors.black,
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
      Get.defaultDialog(
          title: "failed",
          middleText:
              "  false delete from cart try later we will fix it later  ,welcom",
          onCancel: () {
            Get.back();
          });
    }
  }

  getcountitem(itemsId) async {
    var response = await cartData.cartgetcount(
        myservices.sharedPreferences.getString("id")!, itemsId.toString());
    if (response["status"] == "success") {
      int countitem = 0;
      countitem = response['data'];
      return countitem;
    } else {
      Get.defaultDialog(
          title: "failed",
          middleText: "  false get count your items",
          onCancel: () {
            Get.back();
          });
    }
  }

  couponCheck() async {
    var response = await cartData.coupon(couponcontroller!.text);
    if (response["status"] == "success") {
      Map<String, dynamic> coupondata = response["data"];
      couponmodel = CouponModel.fromJson(coupondata);
      disCountCoupon = couponmodel!.couponDiscount!;
      nameCoupon = couponmodel!.couponName!;
      couponId = couponmodel!.couponId!.toString();
      x++;

      update();
      print(coupondata);
    } else {
      disCountCoupon = 0;

      nameCoupon = null;
      couponId = null;
      Get.snackbar("warning", "coupon not found");

      update();
    }
  }

  rfresh() {
    totalcountitems = 0;
    priceorders = 0.0;

    cartview();
    update();
  }

  @override
  void onInit() {
    // getAccessToken();
    couponcontroller = TextEditingController();
    cartview();

    super.onInit();
  }
}
