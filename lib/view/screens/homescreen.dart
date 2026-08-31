import 'dart:io';

import 'package:app/controller/homescreen_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/home/cusotmbottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
       

              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(
                Icons.shopping_basket,
                color: Appcolors.black,
              ),
            ),
            bottomNavigationBar: const CusotmBottomAppbar(),
            // ignore: deprecated_member_use
            body: WillPopScope(
                child: controller.listapges[controller.currentpage],
                onWillPop: () {
                  Get.defaultDialog(
                      middleText: "do you want exit app?",
                      title: "Warning",
                      onCancel: () {},
                      onConfirm: () {
                        exit(0);
                      });

                  return Future.value(false);
                })));
  }
}
 // Row(
                  //   children: [
                  //     CustomButtonBottomBar(
                  //       active: controller.currentpage == 0 ? true : false,
                  //       onPressed: () {
                  //         controller.changepage(0);
                  //       },
                  //       iconButton: Icons.home,
                  //       textButton: "Home",
                  //     ),
                  //     CustomButtonBottomBar(
                  //       active: controller.currentpage == 1 ? true : false,
                  //       onPressed: () {
                  //         controller.changepage(1);
                  //       },
                  //       iconButton: Icons.favorite,
                  //       textButton: "favorite",
                  //     ),
                  //   ],
                  // ),
                  // const Spacer(),
                  // Row(
                  //   children: [
                  //     CustomButtonBottomBar(
                  //       active: controller.currentpage == 2 ? true : false,
                  //       onPressed: () {
                  //         controller.changepage(2);
                  //       },
                  //       iconButton: Icons.person,
                  //       textButton: "Home",
                  //     ),
                  //     CustomButtonBottomBar(
                  //       active: controller.currentpage == 3 ? true : false,
                  //       onPressed: () {
                  //         controller.changepage(3);
                  //       },
                  //       iconButton: Icons.settings,
                  //       textButton: "Home",
                  //     ),
                  //   ],
                  // ),