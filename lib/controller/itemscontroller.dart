import 'package:app/controller/homapage_controller.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/itemsdata.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixContaroller {
  oninitial();
  changecat(int val, String catVal);
  getItems(catId);
  goToDetailItems(itemsModel);
  ItemsModel? itemsModel;
}

class ItemsControllerImp extends ItemsController {
  goToDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  Myservices myservices = Get.find();

  int? selectedCat;
  List? listcategories = [];
  List data = [];
  String? catId;
  ItemsData itemdata = ItemsData(Get.find());
  bool? isshow;
  @override
  getItems(catId) async {
    data.clear();
    var response = await itemdata.getdata(
        catId.toString(), myservices.sharedPreferences.getString("id")!);
    update();
    if (response["status"] == "success") {
      data.addAll(response['data']);
      isshow = true;

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
  oninitial() {
    selectedCat = Get.arguments['selecteditem'];
    listcategories = Get.arguments['listcatigories'];
    catId = Get.arguments['categoryid'];
  }

  @override
  changecat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId);
    update();
  }

  @override
  void onInit() {
    isshow = false;
    oninitial();
    getItems(catId);

    super.onInit();
  }

  @override
  goToDetailItems(itemsModel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsModel});
  }
}
