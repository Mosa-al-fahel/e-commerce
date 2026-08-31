import 'package:app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBackHome extends StatelessWidget {
  const ArrowBackHome({super.key, this.size, this.color});
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.toNamed(AppRoute.homescreen);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: size,
          color: color,
        ));
  }
}
