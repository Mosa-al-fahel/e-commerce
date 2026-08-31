import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class LoignData {
  
  Crud crud = Crud();
  LoignData(this.crud);
  postdata(String password, String email) async {
    var response = await crud.postRequest(AppLinkApi.login, {
      "password": password,
      "email": email,
    });
    return (response);
  }
}
