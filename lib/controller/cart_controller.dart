import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/cartdata.dart';
import 'package:app/data/model/cartmodel.dart';
import 'package:app/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

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
  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
    "type": "service_account",
  "project_id": "ecommerce-c7481",
  "private_key_id": "aa6b93a679edc52d5ebeddb4a52366f8f27e1239",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCadvEkz8s8KReV\nHce+oV8FyqxKME9MCvyjEF1/HdqSZXiQfVaJvd6xfYfTeG/wcnuH9XsCMQLoM+xJ\nH+Bg8Famvb5bSLF6LDWnRWoAdMseetJ/E4+JMNjG3tiiWomTBcDIPOqoQb/8mmQV\nMVkllvyM3tNLMg4vKaGFe6FyyM6cJjRrtow2rYNzCNa3Kf2/Y7fFGHC8fxBJ3jmq\npwflrzfVmU4lK79W6NHJVb8gnyPG9t/EYvzwxDaTQiLOgJ+X89SYsBHN+T2C0vFx\nZj4CIkP4RVtqRPTfoe9armlymcQkUZWSEkazLELvbOHT53gZJF7DUpoUGGV1+few\nEERa044fAgMBAAECggEAShTEh7KvFt3gZRCA1YEgiS8QXY544ZAdZXl6VfZz9yV6\nYtXyFKK+9OIvK/GFwkytyWGnCsCF0+bfKp0CqItsC5FSBAbDs8QTQXOtqKVbK3Wd\nkfvIKfSG6y5CuO7yL1ShhoeMxYCvOs+zM2TVDA2zdz6BGP3bRqxRPqsyHdKIIOQE\n/19IRmLWWoq1bM2EAVUhriodcl/revh9gF3vFPrDStf3MWqhUn2wy0y1CzmaptqM\n+fatAid1N1LK/gMnMqvCH4tsxV2K2tDXktVuY0Cn9541iX0Cg63KYVXlIcUQUzlm\n6zj/HCjcoWKnL3zD1TJsoT66ZiJZOEO9ETYPSu8XiQKBgQDOH0ElJfu/fjCIJs1k\n6gT2SSCzCgKqba51GdB3V4JSrjjAgl0Afe4pZhIduwAU/ZIftigAtoqD6UaZqFcG\nFw9xWAZ1BA6TGBlywGIoIWHodx/OlBgaOqfVqwSSVUpDzvxUuXTT5uVGfqNkO9r4\nT4pmmeN8ZGb1SZ1CDLv96z/BhwKBgQC/16MPgRkycscY8Gu0/KJ1XqHYnIdnDd+g\n2jn4mbnO8T7TZns1HZ9dmWK7dNrSCjH3IUFTfbiDCiexls1tr7uOUsalTkPyMGk5\nyjxohlUr5HYveO0cDplVLZck9+JTMGMHZYLEjI/CurS9zS9qvOO5nxXYSEtQIp0A\nRKyxpP/UqQKBgGdkkh76QJ+7wsho/lqCcN7Bq99jRBcNUZd3zXQvtzWWIu2d9tzK\nTm8BvlCfftkIoQW7L7G73xtwJnPpV028v4hRaVvFHzJ1wj4ndpU+uYgMSS4sZzKw\n/YNWd8KXedsttrEhHhM1HQkReRBMXfh0na39v3ikPGkJ9hItpRcnrCF9AoGAPPQv\n7CIxtlS/q83f+v52Q+KQe/moD/dZgYs09icp4XXHZ3XdWdASrbOpqjQDvs7cd1AK\nqJN+h6w3Vna6yMoYRq1IToeikRYOqPz32qIr96k8X/MFK2/8ChNVPbrBH3t1S4lW\nVkru9olKGjBSi5B+rqC8WR8HRuvohIhNcpghbRkCgYEAkC9CiJxI+ZwEjThGFyXr\nCCMMuFKf6X5iwWOh1RMvnV8m47Zi3EtQoYfOWwcgdG91BAgS7ohcuBc8XItOPwSw\nGMAT+JCASXp22Wl/h0s/r0qcX4e0D8w+WjMBevUwip6n8X5+ta4LSBJHYIEpaKCr\nxCvnbYGCQ3UEQYV5rx9WwKY=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-8fudj@ecommerce-c7481.iam.gserviceaccount.com",
  "client_id": "101224656853587849309",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-8fudj%40ecommerce-c7481.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);

      client.close();
      print("Access Token: ${credentials.accessToken.data}");
      update();
      // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

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
              style: TextStyle(fontSize: 20, color:Appcolors.white)));

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
              style: TextStyle(fontSize: 20, color:Appcolors.white)));

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
    getAccessToken();
    couponcontroller = TextEditingController();
    cartview();

    super.onInit();
  }
}
