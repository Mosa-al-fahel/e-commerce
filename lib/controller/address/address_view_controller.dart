import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/addressdata.dart';
import 'package:app/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AdressViewController extends GetxController {
  Myservices myservices = Get.find();

  AddressData addressdata = AddressData(Get.find());
  bool? isshow;

  List<AddressModel> data = [];

  getData() async {
    var response = await addressdata
        .viewData(myservices.sharedPreferences.getString('id')!);
    if (response['status'] == "success") {
      print(response['data']);
      List listdata = response['data'];
      data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      isshow = false;
      update();
    } else {
      print({"sorry"});
    }
    update();
  }

  delte(int addressid2) {
    data.removeWhere((element) => element.addressId == addressid2);
    update();

  }

  deleteAdress(String addressid) async {
    await addressdata.deleteData(addressid);
    update();
  }

  @override
  void onInit() {
    isshow = data.isEmpty ? false : true;
    super.onInit();
    getData();
  }
}
