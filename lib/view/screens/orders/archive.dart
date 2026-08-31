import 'package:app/controller/archive-orders.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/cardorderlist.dart';
import 'package:app/view/widget/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.white,
          title: const Text("archive"),
          leading: IconButton(
              onPressed: () {
                Get.offNamed(AppRoute.setting);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<OrdersArchiveController>(builder: (controller) {
          if (controller.isshow) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return controller.data.isEmpty
                      ? const Center(child: Text("empty"))
                      : CardOrderList(
                          onRating: () => (showDialogRatin(context,
                              controller.data[index].ordersId.toString())),
                          ordersModel: controller.data[index],
                          status: "archive");
                });
          }
        }));
  }
}
