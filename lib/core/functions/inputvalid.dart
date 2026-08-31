import 'package:get/get.dart';

inputVlid(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "cannot be empty";
  }
  if (val.length < min) {
    return "cannot be less than $min ";
  }
  if (val.length > max) {
    return "cannot be more than $max ";
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "this not email";
    }
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "this not username";
    }
  }
  if (type == "phonenumber") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "this not phonenumber";
    }
  }
}
