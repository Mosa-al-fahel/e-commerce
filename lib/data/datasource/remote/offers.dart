import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class OffersData {
  Crud crud = Crud();
  OffersData(this.crud);
  
  getdata() async {
    var response = await crud.postRequest(
        AppLinkApi.offersitems,{});
    return response;
  }
}
