import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud = Crud();
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postRequest(AppLinkApi.verifycodeforgetpassword,
        {"email": email, "verifycode": verifycode});
    return (response);
  }

  resetCode(String email) async {
    var response =
        await crud.postRequest(AppLinkApi.reSendCode, {"email": email});
    return (response);
  }
}
