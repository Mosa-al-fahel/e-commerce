import 'package:app/controller/itemscontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemCategories extends GetView<ItemsControllerImp> {
  const CustomItemCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesmodel: CategoriesModel.fromJson(
                    controller.listcategories![index]));
          },
          separatorBuilder: (BuildContext, index) {
            return const SizedBox(
              width: 22.2,
            );
          },
          itemCount: controller.listcategories!.length),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesmodel;
  final int i;

  const Categories({super.key, required this.categoriesmodel, required this.i});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        builder: (controller1) => InkWell(
              onTap: () {
                controller.changecat(
                    i, categoriesmodel.categoriesId.toString());
              },
              child: Column(children: [
                const SizedBox(
                  height: 7.1,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, left: 6, right: 6),
                  decoration: controller.selectedCat == i
                      ? const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 3, color: Appcolors.blue2)))
                      : null,
                  child: Text(
                    "${categoriesmodel.categoriesName}",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: controller.selectedCat == i ? 20.5 : 17,
                          color: controller.selectedCat == i
                              ? Appcolors.black
                              : Appcolors.grey,
                        ),
                  ),
                )
              ]),
            ));
  }
}
