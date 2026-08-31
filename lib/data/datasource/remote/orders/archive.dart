import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class ArchiveData {
  Crud crud = Crud();
  ArchiveData(this.crud);
  getOrdersdata(String id) async {
    var response =
        await crud.postRequest(AppLinkApi.orderarchive, {"usersid": id});
    return response;
  }

   setRating(String id, String rating , String comment) async {
    var response =
        await crud.postRequest(AppLinkApi.rating, {"id": id, "rating":rating, "comment":comment});
    return response;
  }
}
