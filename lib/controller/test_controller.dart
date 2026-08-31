import 'package:app/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data1 = [];
  getData() async {
    var response = await testdata.getdata();
    if (response["status"] == "success") {
      data1.addAll(response['data']);
    } else {
      Get.defaultDialog(title: "no data");
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
