import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class ViewFavoriteData {
  Crud crud = Crud();
  ViewFavoriteData(this.crud);
  getdata(String id) async {
    var response = await crud.postRequest(AppLinkApi.favorite, {"id": id});
    return response;
  }

  deletedata(String favid) async {
    var response =
        await crud.postRequest(AppLinkApi.deletefromfav, {"id": favid});
    return response;
  }
}
