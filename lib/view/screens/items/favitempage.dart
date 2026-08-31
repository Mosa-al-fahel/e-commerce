import 'package:app/controller/favoriteview_controller.dart';
import 'package:app/view/widget/items/customlistfavoriteitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<FavoriteViewController>(
              builder: (controller) => ListView(children: [
                    // CustomAppBar(
                    //     titleAppbar: 'search in favorite',
                    //     onPressedIconFavor: () {}),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                        itemBuilder: (context, index) => CustomFavGridItems(
                            favoritemodel: controller.data[index]))
                  ]))),
    );
  }
}
