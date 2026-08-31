import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class FavoriteData {
  Crud crud = Crud();
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postRequest(
        AppLinkApi.addFavorite, {"usersid": usersid, "itemsid": itemsid});
    return response;
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postRequest(
        AppLinkApi.removeFavorite, {"usersid": usersid, "itemsid": itemsid});
    return response;
  }
}
