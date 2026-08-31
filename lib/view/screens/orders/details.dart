import 'package:app/controller/orderdetailscontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController =
        Get.put(OrderdetailsController());
    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Get.offAllNamed(AppRoute.ordersPending);
                },
                child: const Icon(Icons.arrow_back_rounded)),
            backgroundColor: Appcolors.white,
            title: const Text(
              "Order Details",
            )),
        body: GetBuilder<OrderdetailsController>(builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Image.asset(
                      "images/details.png",
                      width: 25,
                      height: 25,
                      color: Appcolors.black,
                    )),
                const Divider(),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "ITEM",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20, color: Appcolors.blue2),
                      ),
                      Text(
                        "QTY",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20, color: Appcolors.blue2),
                      ),
                      Text(
                        "PRICE",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20, color: Appcolors.blue2),
                      ),
                    ]),
                    ...List.generate(controller.listData.length, (index) {
                      return TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "${controller.listData[index].itemsName}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 17, color: Appcolors.grey2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "${controller.listData[index].countitems}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Appcolors.grey2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "${controller.listData[index].itemsprice}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Appcolors.grey2),
                          ),
                        ),
                      ]);
                    })
                  ],
                ),
                Text(
                  "Total price is \n ${controller.detailsData.ordersPricedelivery} "
                  "for delivery + ${controller.detailsData.ordersPrice}"
                  " = ${controller.detailsData.ordersTotalprice}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 22, color: Appcolors.black),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                if (controller.detailsData.addressStreet != null &&
                    controller.detailsData.addressCity != null)
                  Card(
                    elevation: 3,
                    shadowColor: Appcolors.grey,
                    color: Appcolors.secondblue,
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(
                        "${controller.detailsData.addressCity}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 35, color: Appcolors.black),
                      ),
                      subtitle: Text(
                        "${controller.detailsData.addressStreet}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 22, color: Appcolors.grey2),
                      ),
                    ),
                  )
              ],
            ),
          );
        }));
  }
}
