import 'package:app/controller/homapage_controller.dart';
import 'package:app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeCategories extends GetView<HomePageControllerImp> {
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 140,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                selecteditem: index,
                categoriesmodel:
                    CategoriesModel.fromJson(controller.categoroies[index]));
          },
          separatorBuilder: (BuildContext, index) {
            return const SizedBox(
              width: 12.2,
            );
          },
          itemCount: controller.categoroies.length),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesmodel;
  final int selecteditem;

  const Categories(
      {super.key, required this.categoriesmodel, required this.selecteditem});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          controller.goItems(controller.categoroies, selecteditem,
              categoriesmodel.categoriesId!.toString());
        },
        child: Container(
            height: 63.8,
            width: 63.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.5),
                //color: Color.fromARGB(255, 197, 221, 255)
                // Color.fromARGB(255, 201, 229, 255),
                gradient: const LinearGradient(colors: [
                  // Color.fromARGB(56, 246, 251, 255),
                  // Color.fromARGB(37, 0, 140, 255),
                  // Color.fromARGB(86, 0, 59, 197)
                  Color.fromARGB(64, 237, 245, 255),
                  Color.fromARGB(36, 13, 146, 255),
                  Color.fromARGB(75, 0, 59, 197)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Image.asset(
              "images/${categoriesmodel.categoriesImage}",
              height: 60,
              width: 60,
            )),
      ),
      const SizedBox(
        height: 2.1,
      ),
      Text(
        "${categoriesmodel.categoriesName}",
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 17.3,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
      )
    ]);
  }
}
