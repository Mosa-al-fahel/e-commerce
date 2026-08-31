import 'package:app/controller/homescreen_controller.dart';
import 'package:app/view/widget/home/cusotmbottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusotmBottomAppbar extends StatelessWidget {
  const CusotmBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        padding: const EdgeInsets.all(1),
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        color: const Color.fromARGB(255, 9, 56, 186),
        child: Row(
          children: [
            ...List.generate(
                controller.listapges.length,
                (index) => index == 2
                    ? Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: CustomButtonBottomBar(
                            onPressed: () {
                              controller.changepage(index);
                            },
                            iconButton: controller.iconPage[index],
                            textButton: controller.namePages[index],
                            active:
                                controller.currentpage == index ? true : false),
                      )
                    : CustomButtonBottomBar(
                        onPressed: () {
                          controller.changepage(index);
                        },
                        iconButton: controller.iconPage[index],
                        textButton: controller.namePages[index],
                        active: controller.currentpage == index ? true : false))
          ],
        ),
      );
    });
  }
}
