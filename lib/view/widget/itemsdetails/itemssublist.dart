import 'package:app/controller/itemsdetails_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsSubList extends GetView<ItemsDetailsControllerImp> {
  const ItemsSubList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(controller.subItem.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: controller.subItem[index]["active"] == "1"
                    ? Appcolors.blue
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Appcolors.blue)),
            alignment: Alignment.center,
            width: 55,
            height: 55,
            child: Text(
              "${controller.subItem[index]['color']}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: controller.subItem[index]["active"] == "1"
                      ? Colors.white
                      : Appcolors.blue),
            ),
          );
        })
      ],
    );
  }
}
