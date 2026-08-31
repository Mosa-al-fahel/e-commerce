import 'package:flutter/material.dart';
import 'package:get/get.dart';

alert(String middletext, String title, void Function()? onCancel) {
  return Get.defaultDialog(
      middleText: middletext,
      backgroundColor: Colors.white,
      title: title,
      onCancel: onCancel);
}
