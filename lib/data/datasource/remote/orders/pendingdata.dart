import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class PendingData {
  Crud crud = Crud();
  PendingData(this.crud);
  getOrdersdata(String usersid) async {
    var response = await crud.postRequest(
        AppLinkApi.orderpending, {"usersid": usersid});
    return response;
  }
  
   deleteOrdersdata(String ordersid) async {
    var response = await crud.postRequest(
        AppLinkApi.orderDelete, {"ordersid": ordersid});
    return response;
  }
}