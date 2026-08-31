import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class CheckEmailData {
  Crud crud = Crud();
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response =
        await crud.postRequest(AppLinkApi.checkemail, {"email": email});
    return (response);
  }
}
