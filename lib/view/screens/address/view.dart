import 'package:app/controller/address/address_view_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/cart_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddreesView extends StatelessWidget {
  const AddreesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdressViewController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.homescreen);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Appcolors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "location has been added",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoute.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GetBuilder<AdressViewController>(
          builder: (controller2) {
            return !controller2.isshow!
                ? Center(
                    child: controller2.data.isEmpty
                        ? Text(
                            "you did not add any location",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 25, color: Appcolors.grey2),
                          )
                        : ListView.builder(
                            itemCount: controller2.data.length,
                            itemBuilder: (context, index) {
                              return CartAdsress(
                                onDelete: () {
                                  controller2.deleteAdress(controller2
                                      .data[index].addressId
                                      .toString());
                                  controller2.delte(
                                      controller2.data[index].addressId!);
                                },
                                datamodel: controller2.data[index],
                                color: index % 2 == 0
                                    ? Appcolors.white
                                    : Appcolors.blue00,
                                color2: index % 2 == 0
                                    ? Appcolors.black
                                    : Appcolors.black,
                              );
                            }))
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
