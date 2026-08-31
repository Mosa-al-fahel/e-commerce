import 'package:app/core/class/crud.dart';
import 'package:app/core/constant/linkapi.dart';

class TestData {
  Crud crud = Crud();
  TestData(this.crud);
  getdata() async {
    var response = await crud.postRequest(AppLinkApi.test, {});
    return response;
  }
}
