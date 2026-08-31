import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class OrdersDetailsData {
  Crud crud = Crud();
  OrdersDetailsData(this.crud);
  getdata(String id) async {
    var response = await crud.postRequest(
        AppLinkApi.orderDetails, {"id": id });
    return response;
  }
}
