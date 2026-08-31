import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class CheckoutData {
  Crud crud = Crud();
  CheckoutData(this.crud);
  getdata(Map data) async {
    var response = await crud.postRequest(AppLinkApi.checkout, data);
    return response;
  }
}