import 'package:app/view/screens/home.dart';
import 'package:app/view/screens/items/offers.dart';
import 'package:app/view/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int currentpage);
  int currentpage = 0;
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listapges = [
    const HomePage(),
    const OffersItems(),
    const Center(
      child: Column(
        children: [Text("mosa"), Text("mosa"), Text("mosa")],
      ),
    ),
    const Setting(),
  ];

  List<String> namePages = ["home", "offers", "Profile", "Setting"];
  List<IconData> iconPage = [
    Icons.home,
    Icons.local_offer,
    Icons.person,
    Icons.settings,
  ];

  @override
  changepage(int i) {
    currentpage = i;

    update();
  }
}
