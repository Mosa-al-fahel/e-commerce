import 'package:app/controller/ordercontroller.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/cardorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              onPressed: () {
                Get.offAllNamed(AppRoute.setting);
              }),
          title: const Text("Orders Pending"),
        ),
        body: SafeArea(
            child: GetBuilder<OrdersController>(
                builder: (controller) => controller.data.isEmpty
                    ? const Center(child: Text("empty"))
                    : ListView.builder(
                        itemCount:
                            controller.data.length, //controller.data.length,
                        itemBuilder: (context, index) => controller.isshow ==
                                true
                            ? const Center(child: CircularProgressIndicator())
                            : CardOrderList(
                                status: controller.printStatus(
                                    controller.data[index].ordersStatus!),
                                onDelete: () {
                                  controller.deleteorder(controller
                                      .data[index].ordersId
                                      .toString());
                                },
                                ordersModel: controller.data[index],
                                onPressed: () {
                                  Get.offAllNamed(AppRoute.ordersDetails,
                                      arguments: {
                                        "listdata": controller.data[index]
                                      });
                                },
                              )))));
  }
}
