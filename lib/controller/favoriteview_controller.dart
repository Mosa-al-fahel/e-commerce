import 'package:app/core/services/services.dart';
import 'package:app/data/datasource/remote/favorite.dart';
import 'package:app/data/model/favoritemodel.dart';
import 'package:get/get.dart';

class FavoriteViewController extends GetxController {
  Myservices myservices = Get.find();
  ViewFavoriteData favoriteData = ViewFavoriteData(Get.find());
  List<FavoriteModel> data = [];
  @override
  void onInit() {
    viewfavorite();

    print("================================");
    print(data);
    super.onInit();
  }

  viewfavorite() async {
    data.clear();
    var response = await favoriteData
        .getdata(myservices.sharedPreferences.getString("id")!);

    if (response["status"] == "success") {
      List responsedata = response["data"];
      data.addAll(
          responsedata.map((element) => FavoriteModel.fromJson(element)));
      print(data);
    } else {
      Get.defaultDialog(
          title: "failed to show the favorit list",
          middleText: " try later we will fix it later  ,welcom",
          onCancel: () {
            Get.back();
          });
    }
    update();
  }

  deletefromfavorite(favid) async {
    var response = await favoriteData.deletedata(favid.toString());
    update();
    if (response["status"] == "success") {
      data.removeWhere((element) => element.favoriteId == favid);
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
