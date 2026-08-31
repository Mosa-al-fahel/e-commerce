import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class CartData {
  Crud crud = Crud();
  CartData(this.crud);

  cartadd(String usersid, String itemsid) async {
    var response = await crud.postRequest(
        AppLinkApi.cartadd, {"usersid": usersid, "itemsid": itemsid});
    return response;
  }

  cartdelete(String usersid, String itemsid) async {
    var response = await crud.postRequest(
        AppLinkApi.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response;
  }
   cartgetcount(String usersid, String itemsid) async {
    var response = await crud.postRequest(
        AppLinkApi.getcountitem, {"usersid": usersid, "itemsid": itemsid});
    return response;
  }
 cartview(String usersid) async {
    var response = await crud.postRequest(
        AppLinkApi.cartview, {"usersid": usersid});
    return response;
  }

   coupon(String couponname) async {
    var response = await crud.postRequest(
        AppLinkApi.checkcoupon, {"couponname": couponname});
    return response;
  }


}
