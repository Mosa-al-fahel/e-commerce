import 'package:app/controller/cart_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/view/widget/cart/card_items_cart_list.dart';
import 'package:app/view/widget/cart/custumbottomnavcart.dart';
import 'package:app/view/widget/cart/headcartpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(builder: (con) {
          return CustomBottomNavCart(
            onPressCoupon: () {
              print('object');
              con.couponCheck();
            },
            price: "${con.priceorders}",
            discount: "${cartcontroller.disCountCoupon}",
            totalprice: "${con.getFinalPrice()}",
            couponcontroller: cartcontroller.couponcontroller!,
          );
        }),
        backgroundColor: Appcolors.white,
        body: GetBuilder<CartController>(builder: (controller) {
          return Container(
              padding: const EdgeInsets.all(5),
              child: ListView(
                children: [
                  const HeadCartPage(),
                  const HeadTextCartPage(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ...List.generate(controller.data.length, (ind) {
                        return CardItemsCartList(
                          itemName: controller.data[ind].itemsName!,
                          itemPrice: controller.data[ind].itemsprice!,
                          itemImage: controller.data[ind].itemsImage!,
                          countitems: controller.data[ind].countitems!,
                        );
                      })
                    ],
                  ),
                  TextCountItems(countitems: controller.totalcountitems),
                ],
              ));
        }));
  }
}
