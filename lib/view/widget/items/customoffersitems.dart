import 'package:app/controller/favoritecontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridOffersItems extends StatelessWidget {
  const CustomGridOffersItems({super.key, required this.itemsmodel});
  final ItemsModel itemsmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: const Color.fromARGB(255, 228, 231, 255),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
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
                              .copyWith(fontSize: 20, color: Appcolors.blue2),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [

                          //     Text(
                          //       " old price ${itemsmodel.itemsPrice}",
                          //       textAlign: TextAlign.center,
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .bodyLarge!
                          //           .copyWith(
                          //               fontSize: 20, color: Appcolors.black),
                          //     ),
                          //     Text(
                          //       " Became ${itemsmodel.itemsPriceDisCount} \$",
                          //       textAlign: TextAlign.center,
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .bodyLarge!
                          //           .copyWith(
                          //               fontSize: 22, color: Appcolors.black),
                          //     ),
                          //   ],
                          // ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GetBuilder<FavoriteController>(
                            builder: (controllerFav) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "add favorite",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Appcolors.grey2,
                                        fontSize: 19,
                                        height: 01),
                              ),
                              IconButton(
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
                                  )),
                            ],
                          );
                        })
                      ],
                    ),
                    Positioned(
                        top: -6,
                        left: 5,
                        child: Text("Discount ${itemsmodel.itemsDiscount}\$",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 22, color: Appcolors.black)))
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
