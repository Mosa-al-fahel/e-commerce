import 'package:app/controller/favoritecontroller.dart';
import 'package:app/controller/itemscontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridItems extends GetView<ItemsControllerImp> {
  const CustomGridItems({super.key, required this.itemsmodel});
  final ItemsModel itemsmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToDetailItems(itemsmodel);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: Appcolors.blue00,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                            tag: "${itemsmodel.itemsId}",
                            child: Image.asset(
                              "images/${itemsmodel.itemsImage}",
                              height: 130,
                              width: 130,
                            )),
                        Text(
                          "${itemsmodel.itemsName}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20, color: Appcolors.black),
                        ),
                        Text(
                          "${itemsmodel.itemsDesc}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20, color: Appcolors.grey2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${itemsmodel.itemsPriceDisCount}\$",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolors.black),
                            ),
                            GetBuilder<FavoriteController>(
                                builder: (controllerFav) {
                              return IconButton(
                                  onPressed: () {
                                    if (controllerFav
                                            .isFavorite[itemsmodel.itemsId] ==
                                        "1") {
                                      controllerFav
                                          .removefavorite(itemsmodel.itemsId);
                                      controllerFav.setFav(
                                          itemsmodel.itemsId, "0");
                                    } else {
                                      controllerFav.setFav(
                                          itemsmodel.itemsId, "1");
                                      controllerFav
                                          .addfavorite(itemsmodel.itemsId);
                                    }
                                  },
                                  icon: Icon(
                                    controllerFav.isFavorite[
                                                itemsmodel.itemsId] ==
                                            '1'
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Appcolors.black,
                                  ));
                            })
                          ],
                        ),
                      ],
                    ),
                    //to view discount on grid
                    // Positioned(
                    //   top: -5,
                    //   child: Container(
                    //     padding:
                    //         const EdgeInsets.only(left: 6, right: 6, top: 7.5),
                    //     decoration: BoxDecoration(
                    //         border:
                    //             Border.all(width: 1.2, color: Appcolors.black),
                    //         color: Appcolors.white,
                    //         borderRadius: BorderRadius.circular(9.5)),
                    //     child: Text(
                    //       "${itemsmodel.itemsDiscount}\$ Discount",
                    //       style: const TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Appcolors.black),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            // if (itemsmodel.itemsDiscount != 0)
            //   Positioned(
            //       child: Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(1000),
            //       color: Appcolors.blue2,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text("sell",
            //             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                 color: Appcolors.white, height: 1.2, fontSize: 20)),
            //         const SizedBox(
            //           width: 5,
            //         ),
            //         Text("${itemsmodel.itemsDiscount}%",
            //             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //                 color: Appcolors.white, height: 1.1, fontSize: 18))
            //       ],
            //     ),
            //   ))
          ],
        ));
  }
}
