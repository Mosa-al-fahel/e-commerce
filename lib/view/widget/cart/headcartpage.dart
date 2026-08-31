import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadCartPage extends StatelessWidget {
  const HeadCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Appcolors.black,
                  size: 28,
                ))),
                
        Container(
          margin: EdgeInsets.only(left: Get.width / 6.6),
          alignment: Alignment.center,
          child: Image.asset(
            Imagesasset.cart,
            height: 120,
          ),
        ),
      ],
    );
  }
}

class HeadTextCartPage extends StatelessWidget {
  const HeadTextCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "All items",
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(color: Appcolors.black, fontSize: 30, height: 1.1),
    );
  }
}

class TextCountItems extends StatelessWidget {
  final int countitems;

  const TextCountItems({super.key, required this.countitems});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
          textAlign: TextAlign.center,
          "$countitems  items",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Appcolors.grey1, fontSize: 20, height: 1.1)),
    );
  }
}
