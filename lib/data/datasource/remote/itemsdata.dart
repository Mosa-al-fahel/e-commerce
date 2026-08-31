import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class ItemsData {
  Crud crud = Crud();
  ItemsData(this.crud);
  getdata(String id, String usersid) async {
    var response = await crud.postRequest(
        AppLinkApi.items, {"id": id.toString(), "usersid": usersid});
    return response;
  }
}
