import 'package:app/controller/favoritecontroller.dart';
import 'package:app/controller/itemscontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:app/view/widget/customappbar.dart';
import 'package:app/view/widget/home/icon-backtohome.dart';
import 'package:app/view/widget/items/CustomItemCategories.dart';
import 'package:app/view/widget/items/customgriditems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
          builder: (controller2) => !controller2.issearch 
              ? Container(
                  padding: const EdgeInsets.all(12),
                  child: ListView(
                    children:  
                 
                     [

                      
                       CustomAppBar(
                            onPressed: controller2.searchdone,
                            onPressedIconFavor: () {
                              Get.toNamed(AppRoute.favpage);
                            },
                            titleAppbar: "Get your products",
                            onChanged: (string) {
                              controller2.checkSearch(string);
                            },
                            textController: controller2.textController,
                          ),

                      const CustomItemCategories(),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller2.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[controller2.data[index]
                                    ['items_id']] =
                                controller2.data[index]['favorite'];

                            return CustomGridItems(
                              itemsmodel:
                                  ItemsModel.fromJson(controller2.data[index]),
                            );
                          }),
                           const ArrowBackHome()
                    ],
                   
                  ),
                ) 
              : ItemsResultSearch(itemsSearchModel: controller2.listItemsSearch))
    );
  }
}

class ItemsResultSearch extends GetView<ItemsControllerImp> {
  final List<ItemsModel> itemsSearchModel;
  const ItemsResultSearch({super.key, required this.itemsSearchModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemsSearchModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 2),
        itemBuilder: (context, ind) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                controller.goToDetails(itemsSearchModel[ind]);
              },
              child: Card(
                  color: Appcolors.white,
                  child: Column(children: [
                    Text(
                      textAlign: TextAlign.center,
                      "${itemsSearchModel[ind].itemsName}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22, height: 0.9, color: Appcolors.grey2),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'images/${itemsSearchModel[ind].itemsImage}',
                      height: 120,
                    ),
                    Text(
                      "from ${itemsSearchModel[ind].categoriesName}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 12),
                    )
                  ])),
            ),
          );
        });
  }
}
