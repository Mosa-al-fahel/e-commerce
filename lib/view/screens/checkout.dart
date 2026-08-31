import 'package:app/controller/checkout/checkoutcontroller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/checkout/bottomnavigationbar.dart';
import 'package:app/view/widget/checkout/carddliveryway.dart';
import 'package:app/view/widget/checkout/cardpaymethod.dart';
import 'package:app/view/widget/checkout/cardshippingadress.dart';
import 'package:app/view/widget/checkout/titletext.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CeckOutController controller = Get.put(CeckOutController());
    return Scaffold(
        bottomNavigationBar: BottomNavcheckout(
          onPressed: () {
            controller.checkout();
          },
        ),
        appBar: AppBar(
          title: const Text("CheckOut"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<CeckOutController>(builder: (controller) {
              return Container(
                child: ListView(
                  children: [
                    const Titletext(titletext: "Choose payment method :"),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosepayMethod("1");
                        },
                        child: CardPayMethod(
                            title: "payment card",
                            active: controller.paymentMethod == "1"
                                ? true
                                : false)),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosepayMethod("0");
                        },
                        child: CardPayMethod(
                            title: "Cash",
                            active: controller.paymentMethod == "0"
                                ? true
                                : false)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Titletext(titletext: "Choose Delivery way :"),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.choosedileveryWay("0");
                          },
                          child: CardDliveryWay(
                              title: 'Delivery',
                              imageName: "deliverycar.png",
                              active:
                                  controller.deliveryWay == "0" ? true : false),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosedileveryWay("1");
                          },
                          child: CardDliveryWay(
                              title: 'recive',
                              imageName: "drivethru.png",
                              active:
                                  controller.deliveryWay == "1" ? true : false),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (controller.deliveryWay == '0')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.dataadress.isEmpty)
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.addressAdd);
                                },
                                child: Text(
                                  "Add Shipping Adress?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20, color: Appcolors.grey2),
                                ),
                              ),
                            ),
                          if (controller.dataadress.isNotEmpty)
                            const Titletext(titletext: "shipping address :"),
                          const SizedBox(
                            height: 12,
                          ),
                          ...List.generate(
                            controller.dataadress.length,
                            (index) => CardShippingAdress(
                                onTap2: () => controller.chooseadreesId(
                                    controller.dataadress[index].addressId!),
                                title:
                                    "${controller.dataadress[index].addressName}",
                                active: controller.adreesId ==
                                        controller.dataadress[index].addressId
                                    ? true
                                    : false,
                                subtitle:
                                    "${controller.dataadress[index].addressCity} ${controller.dataadress[index].addressStreet}"),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            })));
  }
}
