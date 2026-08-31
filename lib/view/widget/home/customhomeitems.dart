import 'package:app/controller/homapage_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeItems extends GetView<HomePageControllerImp> {
  const CustomHomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;

  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 52),
              child: Image.asset(
                'images/${itemsModel.itemsImage}',
                width: 160,
                height: 160,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 19),
            height: 170,
            width: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [
                  // Color.fromARGB(10, 176, 205, 255),
                  // Color.fromARGB(137, 56, 122, 255),
                  Color.fromARGB(0, 92, 255, 171),
                  Color.fromARGB(4, 219, 227, 255),
                  Color.fromARGB(26, 40, 126, 255),
                  // Color.fromARGB(105, 4, 66, 180)
                  Color.fromARGB(91, 72, 118, 255)
                  //mosa
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Positioned(
              left: 27,
              top: 3,
              child: Text(
                "${itemsModel.itemsName}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 0.6,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.black),
                //mosa
              ))
        ],
      ),
    );
  }
}
