import 'package:app/controller/cart_controller.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  CartController cartcontroller = Get.put(CartController());
  late ItemsModel itemsmodel;
  int count = 0;
  bool? isshow;
  

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  List subItem = [
    {"id": "1", "color": "blue", "active": "0"},
    {"id": "2", "color": "red", "active": "1"},
    {"id": "3", "color": "green", "active": "1"}
  ];
  add() {
    cartcontroller.addcart(itemsmodel.itemsId);
    count++;
    update();
  }

  remove() {
    if (count > 0) {
      count--;
      cartcontroller.deletecart(itemsmodel.itemsId);
      
      update();
    }
  }

  @override
  initialData() async {
    isshow = false;
    itemsmodel = Get.arguments["itemsmodel"];
    count = await cartcontroller.getcountitem(itemsmodel.itemsId!);
    isshow = true;
    update();
  }
}
