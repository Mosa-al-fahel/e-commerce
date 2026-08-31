import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class AddressData {
  Crud crud = Crud();
  AddressData(this.crud);

  addData(String usersid,String city, String street, String name) async {
    var response = await crud.postRequest(AppLinkApi.addressAdd,
        {"usersid": usersid,"city": city,"street": street,"name": name});
    return response;
  }


  deleteData(String  addressid) async {
    var response = await crud
        .postRequest(AppLinkApi.addressDelete, {"addressid": addressid});
    return response;
  }

  viewData(String usersid) async {
    var response =
        await crud.postRequest(AppLinkApi.addressView, {"usersid": usersid});
    return response;
  }
}
