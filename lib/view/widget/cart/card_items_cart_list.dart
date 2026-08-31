import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardItemsCartList extends StatelessWidget {
  const CardItemsCartList(
      {super.key,
      required this.countitems,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage, });
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final String countitems;



  @override
  Widget build(BuildContext context) {
    
    
    return InkWell(
      onTap: () {},
      child: Card(
        color: Appcolors.backgroundbluetowhite,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "images/$itemImage",
                height: 110,
              ),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text(
                  itemName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 30, color: Appcolors.black, height: 1.1),
                ),
                subtitle: Text(
                  "$itemPrice\$",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20, color: Appcolors.grey2),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // InkWell(
                  //     onTap: () {},
                  //     child: Image.asset(
                  //       Imagesasset.pluslogo,
                  //       height: 1,
                  //     )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(countitems,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 26)),
                  ),
                  // InkWell(
                  //     onTap: () {},
                  //     child: Image.asset(
                  //       Imagesasset.minuslogo,
                  //       height: 1,
                  //     )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
