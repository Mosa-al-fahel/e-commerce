import 'package:app/controller/itemsdetails_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/itemsdetails/bottomnav_additem.dart';
import 'package:app/view/widget/itemsdetails/itemsdetails-name.dart';
import 'package:app/view/widget/itemsdetails/itemssublist.dart';
import 'package:app/view/widget/itemsdetails/rowpricewithcount.dart';
import 'package:app/view/widget/itemsdetails/stackheadpage.dart';
import 'package:app/view/widget/itemsdetails/textitemdesc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(bottomNavigationBar: BottomNavAddItem(
      onTap: () {
        Get.toNamed(AppRoute.cart);
        controller.cartcontroller.rfresh();
      },
    ), body: GetBuilder<ItemsDetailsControllerImp>(builder: (controller) {
      return controller.isshow!
          ? ListView(
              children: [
                const StackHeadPage(),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemsDetailsName("${controller.itemsmodel.itemsName}"),
                      PriceWithCount(
                        price: '${controller.itemsmodel.itemsPrice}',
                        count: '${controller.count}',
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                      ),
                      const TextItemDesc(),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Colors Available",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Appcolors.blue2, fontSize: 28)),
                      const SizedBox(
                        height: 8,
                      ),
                      const ItemsSubList()
                    ],
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator());
    }));
  }
}
