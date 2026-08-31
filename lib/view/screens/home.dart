import 'package:app/controller/homapage_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:app/view/widget/customappbar.dart';
import 'package:app/view/widget/home/customcardhome.dart';
import 'package:app/view/widget/home/customhomecategories.dart';
import 'package:app/view/widget/home/customhomeitems.dart';
import 'package:app/view/widget/home/customtext.dart';
import 'package:app/view/widget/home/positionimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return Material(
      child: SafeArea(
        child: Form(
            child: GetBuilder<HomePageControllerImp>(
                builder: (controller) => controller.isshow!
                    ? Container(
                        padding: const EdgeInsets.all(12),
                        child: ListView(
                          children: <Widget>[
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
                            !controller.issearch
                                ? Column(
                                    children: [
                                      Stack(children: [
                                        if(controller.setting.isNotEmpty)
                                        CustomCardHome(
                                            titlecardhome:
                                                "${controller.setting[0]['setting_title']}",
                                            bodycardhome:
                                                "${controller.setting[0]['setting_body']}"),
                                         const PositionImage()
                                      ]),
                                      const CustomHomeText(
                                          texthome: "categories"),
                                      const CustomHomeCategories(),
                                      const CustomHomeText(
                                          texthome: "Top Selling"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const CustomHomeItems(),
                                    ],
                                  )
                                : ItemsResultSearch(
                                    itemsSearchModel:
                                        controller.listItemsSearch)
                          ],
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()))),
      ),
    );
  }
}

class ItemsResultSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> itemsSearchModel;
  const ItemsResultSearch({super.key, required this.itemsSearchModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemsSearchModel.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 226, 238, 255),
            child: Row(
              children: [
                Image.asset(
                  'images/${itemsSearchModel[index].itemsImage}',
                  height: 100,
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      "${itemsSearchModel[index].itemsName}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 23),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${itemsSearchModel[index].categoriesName}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, color: Appcolors.grey2),
                  ),
                )
              ],
            ),
          );
        });
  }
}
//  GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: itemsSearchModel.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, mainAxisSpacing: 2),
//         itemBuilder: (context, ind) {
//           return Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: InkWell(
//               onTap: () {
//                 controller.goToDetails(itemsSearchModel[ind]);
//               },
//               child: Card(
//                   color: Appcolors.white,
//                   child: Column(children: [
//                     Text(
//                       textAlign: TextAlign.center,
//                       "${itemsSearchModel[ind].itemsName}",
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           fontSize: 22, height: 0.9, color: Appcolors.grey2),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Image.asset(
//                       'images/${itemsSearchModel[ind].itemsImage}',
//                       height: 120,
//                     ),
//                     Text(
//                       "from ${itemsSearchModel[ind].categoriesName}",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineLarge!
//                           .copyWith(fontSize: 12),
//                     )
//                   ])),
//             ),
//           );
//         });