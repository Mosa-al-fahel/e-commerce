import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class SignupData {
  Crud crud = Crud();
  SignupData(this.crud);
  postdata(String username, String password, String email, String phone) async {
    var response = await crud.postRequest(AppLinkApi.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone
    });
    return (response);
  }
}
