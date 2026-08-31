import 'package:app/controller/cart_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/view/widget/cart/buttonbottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalprice;
  final TextEditingController couponcontroller;
  final void Function()? onPressCoupon;
  const CustomBottomNavCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.couponcontroller,
      required this.onPressCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Appcolors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder: (controller) {
            return controller.x == 0
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: couponcontroller,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2.4, horizontal: 30),
                            filled: true,
                            fillColor: Appcolors.white,
                            hintText: "coupon",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Appcolors.grey),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 23,
                                    color: const Color.fromARGB(
                                        255, 151, 151, 151)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Appcolors.grey, width: 0.2),
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolors.secondblue,
                              ),
                              child: TextButton(
                                  onPressed: onPressCoupon,
                                  child: Text(
                                    "apply",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            color: Appcolors.blue2),
                                  )))),
                    ],
                  )
                : Text(
                    "Coupon Code ${controller.couponmodel!.couponName} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 24, color: Appcolors.grey1),
                  );
          }),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Appcolors.backgroundbluetowhite, Appcolors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                border: Border.all(color: Appcolors.black, width: 0.5)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "price",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontSize: 20,
                                height: 0.1,
                                color: Appcolors.black),
                      ),
                      Text("$price\$",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 20,
                                  height: 1.5,
                                  color: Appcolors.black))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20, color: Appcolors.black)),
                      Text("$discount%",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20, color: Appcolors.black))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "shipping",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontSize: 20,
                                height: 0.1,
                                color: Appcolors.black),
                      ),
                      Text("10\$",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 20,
                                  height: 1.5,
                                  color: Appcolors.black))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("total price",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20, color: Appcolors.black)),
                      Text("$totalprice\$",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20, color: Appcolors.black))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ButtonBottomCart(
            onTap: () {
              controller.goCheckOut();

              // Get.offNamed(AppRoute.chekcout, arguments: totalprice ,);
            },
          ),
        ],
      ),
    );
  }
}
