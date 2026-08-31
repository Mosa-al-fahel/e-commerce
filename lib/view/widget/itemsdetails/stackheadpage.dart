import 'package:app/controller/itemsdetails_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/view/widget/home/icon-backtohome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackHeadPage extends GetView<ItemsDetailsControllerImp> {
  const StackHeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 112, 163, 233),
                Color.fromARGB(255, 229, 235, 255)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          height: 200,
          width: double.infinity,
        ),
        Positioned(
            top: 10,
            left: Get.width / 10,
            right: Get.width / 10,
            child: Container(
                margin: const EdgeInsets.only(top: 60),
                child: Hero(
                    tag: "${controller.itemsmodel.itemsId}",
                    child: Image.asset(
                      "images/${controller.itemsmodel.itemsImage}",
                      width: 250,
                      height: 250,
                    )))),
        if (controller.itemsmodel.itemsDiscount != null)
          Positioned(
            top: 35,
            left: 135,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.fromDirection(
                        // BorderSide.strokeAlignCenter,
                        BorderSide.strokeAlignOutside,
                      ),
                      color: Appcolors.orange,
                    ),
                    BoxShadow(
                      offset: Offset.fromDirection(
                        // BorderSide.strokeAlignCenter,
                        BorderSide.strokeAlignCenter,
                      ),
                      color: Appcolors.orange,
                    ),
                    BoxShadow(
                      offset: Offset.fromDirection(
                        // BorderSide.strokeAlignCenter,
                        BorderSide.strokeAlignInside,
                      ),
                      color: Appcolors.white,
                    ),
                  ],
                  // border: Border.all(width: 0.4, color: Appcolors.white),
                  borderRadius: BorderRadius.circular(13),
                  color: Appcolors.secondblue),
              child: Text(
                textAlign: TextAlign.center,
                "${controller.itemsmodel.itemsDiscount}\$ Discount",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Appcolors.blue2, fontSize: 23),
              ),
            ),
          ),
        Container(
            margin: const EdgeInsets.only(top: 50),
            child: const ArrowBackHome(
              color: Appcolors.black,
            ))
      ],
    );
  }
}
