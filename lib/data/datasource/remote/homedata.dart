import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class HomeData {
  Crud crud = Crud();
  HomeData(this.crud);
  getdata() async {
    var response = await crud.postRequest(AppLinkApi.home, {});
    return response;
  }
   searchitems(String search) async {
    var response = await crud.postRequest(AppLinkApi.searchitems, {
      "search": search
    });
    return response;
  }
}
