import 'package:app/controller/favoriteview_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/favoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavGridItems extends GetView<FavoriteViewController> {
  const CustomFavGridItems({super.key, required this.favoritemodel});
  final FavoriteModel favoritemodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          color: Appcolors.blue00,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: "${favoritemodel.itemsId}",
                    child: Image.asset(
                      "images/${favoritemodel.itemsImage}",
                      height: 130,
                      width: 130,
                    )),
                Text(
                  "${favoritemodel.itemsName}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20, color: Colors.black),
                ),
                const Text(
                  " hello best iphone in 2023 ever or neither",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 153, 153, 153),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${favoritemodel.itemsPrice}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 19, 139)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller
                              .deletefromfavorite(favoritemodel.favoriteId!);
                        },
                        icon: const Icon(Icons.delete_outline_outlined))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
