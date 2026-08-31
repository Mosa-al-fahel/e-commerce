import 'package:app/controller/favoritecontroller.dart';
import 'package:app/controller/offers_controller.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/screens/home.dart';
import 'package:app/view/widget/customappbar.dart';
import 'package:app/view/widget/items/customoffersitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersItems extends StatelessWidget {
  const OffersItems({super.key});

  @override
  Widget build(BuildContext context) {
    OffersItemsController controller = Get.put(OffersItemsController());
    Get.put(FavoriteController());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          CustomAppBar(
            onPressed: controller.searchdone,
            onPressedIconFavor: () {
              Get.toNamed(AppRoute.favpage);
            },
            titleAppbar: "Get your products",
            onChanged: (string) {
              controller.checkSearch(string);
            },
            textController: controller.textController,
          ),
          GetBuilder<OffersItemsController>(builder: (controller) {
            return !controller.issearch
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => controller.isshow
                        ? const Center(child: CircularProgressIndicator())
                        : CustomGridOffersItems(
                            itemsmodel: controller.data[index]))
                : ItemsResultSearch(
                    itemsSearchModel: controller.listItemsSearch);
          }),
        ],
      ),
    ));
  }
}
