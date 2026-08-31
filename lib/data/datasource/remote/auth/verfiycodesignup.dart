import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud = Crud();
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postRequest(AppLinkApi.verfiycodesignup,
        {"email": email, "verifycode": verifycode});
    return (response);
  }

  reSendData(String email) async {
    var response =
        await crud.postRequest(AppLinkApi.reSendCode, {"email": email});
    return (response);
  }
}
