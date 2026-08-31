// ignore: file_names
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/orders/archive.dart';
import 'package:app/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  late bool isshow;

  List<OrdersModel> data = [];
  ArchiveData archivedata = ArchiveData(Get.find());
  Myservices myservices = Get.find();

  getArchiveData() async {
    data.clear();

    var response = await archivedata
        .getOrdersdata(myservices.sharedPreferences.getString("id")!);

    if (response["status"] == "success") {
      List listData = response['data'];

      data.addAll(listData.map((e) => OrdersModel.fromJson(e)));

      isshow = false;
      update();
    } else {
      Get.defaultDialog(
          title: "welcome",
          middleText: "your archive is empty",
          onCancel: () {
            Get.back();
          });
    }
  }

  setRating(String id, double rating, String comment) async {
    
    var response = await archivedata.setRating(id, rating.toString(), comment);
    if (response["status"] == "success") {
      Get.snackbar("rating done", " welocme");
      update();
    } else {
      Get.snackbar('sorry', "we will fix the issues");
    }
  }

  @override
  void onInit() {
    isshow = true;
    getArchiveData();
    super.onInit();
  }
}
