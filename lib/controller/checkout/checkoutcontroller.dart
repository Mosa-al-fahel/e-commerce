import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/addressdata.dart';
import 'package:app/data/datasource/remote/checkoutdata.dart';
import 'package:app/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CeckOutController extends GetxController {
  String? paymentMethod;
  String? deliveryWay;
  int adreesId = 0;
  late String priceorder;
  late String coupondi;
  late String discountcoupon;

  Myservices myservices = Get.find();
  List<AddressModel> dataadress = [];
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  choosepayMethod(String pay) {
    paymentMethod = pay;
    update();
  }

  choosedileveryWay(String delivery) {
    deliveryWay = delivery;
    update();
  }

  chooseadreesId(int adress) {
    adreesId = adress;
    update();
  }

  getshippingaddress() async {
    var response = await addressData
        .viewData(myservices.sharedPreferences.getString("id")!);
    if (response['status'] == 'success') {
      print(response['data']);

      List data = response['data'];
      dataadress.addAll(data.map((e) => AddressModel.fromJson(e)));
      adreesId = dataadress[0].addressId!;
    }
    update();
  }

  checkout() async {
    if (adreesId == 0) {
      return Get.snackbar("sorry", "please add adress shpping");
    }
    if (paymentMethod == null) {
      return Get.snackbar("sorry", "please add payment method");
    }

    if (deliveryWay == null) {
      return Get.snackbar(
        'sorry',
        "please add delivery way",
      );
    }
    update();

    Map data = {
      "usersid": myservices.sharedPreferences.getString('id'),
      "addressid": adreesId.toString(),
      "orderstype": deliveryWay,
      "pricedelivery": "10",
      "ordersprice": priceorder,
      "couponid": coupondi,
      "paymentmethod": paymentMethod,
      "coupondiscount": discountcoupon.toString(),
    };
    var response = await checkoutData.getdata(data);

    if (response["status"] == "success") {
      Get.snackbar("Succes", "the order done successfuly");
      Get.toNamed(AppRoute.homescreen);
      paymentMethod = "";
      deliveryWay = "";
    } else {
      Get.snackbar("Error", "some thing went wrong");
    }
    update();
  }

  @override
  void onInit() {
    coupondi = Get.arguments["couponid"];
    priceorder = Get.arguments["priceorder"];
    discountcoupon = Get.arguments['coupondiscount'].toString();

    getshippingaddress();

    super.onInit();
  }
}
