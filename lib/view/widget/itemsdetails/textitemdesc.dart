import 'package:app/controller/itemsdetails_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextItemDesc extends GetView<ItemsDetailsControllerImp> {
  const TextItemDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${controller.itemsmodel.itemsDesc},${controller.itemsmodel.itemsDesc},${controller.itemsmodel.itemsDesc}",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 24, color: Appcolors.grey2),
    );
  }
}
