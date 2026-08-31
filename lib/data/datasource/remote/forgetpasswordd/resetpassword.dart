import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class ResetPasswordData {
  Crud crud = Crud();
  ResetPasswordData(this.crud);
  postdata(String password, String email) async {
    var response = await crud.postRequest(
        AppLinkApi.resetpassword, {"password": password, "email": email});
    return (response);
  }
}
