import 'package:app/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(
          builder: (controller) => ListView.builder(
              itemCount: controller.data1.length,
              itemBuilder: (context, index) {
                return Center(child: Text("${controller.data1}"));
              })),
    );
  }
}


//orginial in pending.dart
// import 'package:app/controller/ordercontroller.dart';
// import 'package:app/core/constant/routes.dart';
// import 'package:app/view/widget/cardorderlist.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Pending extends StatelessWidget {
//   const Pending({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(OrdersController());
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new_sharp),
//               onPressed: () {}),
//           title: const Text("Orders Pending"),
//         ),
//         body: SafeArea(
//             child: GetBuilder<OrdersController>(
//                 builder: (controller) => controller.isshow == true
//                     ? const Center(child: CircularProgressIndicator())
//                     : ListView.builder(
//                         itemCount:
//                             controller.data.length, //controller.data.length,
//                         itemBuilder: (context, index) => CardOrdersList(
//                             onPressed: () {
//                               Get.offNamed(AppRoute.ordersDetails,
//                               arguments: {"listdata": controller.data[index]}
//                                   );
//                             },
//                             orderid:
//                                 "Number Of Order : ${controller.data[index].ordersId}",
//                             orderdeliveryprice:
//                                 "Delivery Price  : ${controller.data[index].ordersPricedelivery}",
//                             orderprice:
//                                 "Order Price     : ${controller.data[index].ordersPrice}",
//                             orderpaymethod:
//                                 controller.data[index].ordersPaymentmethod ==
//                                         "1"
//                                     ? "Order payment : done by cash"
//                                     : "Order payment : done by card",
//                             orderwayrecive:
//                                 controller.data[index].ordersType == "1"
//                                     ? "Order recive : has delivered for you"
//                                     : "Order recive    : recive",
//                             ordertotalprice:
//                                 "Order total price : ${controller.data[index].ordersTotalprice}")))));
//   }
// }




//////////////////////////////////////////
///controller is :
// import 'package:app/core/services/services.dart';
// import 'package:app/data/datasource/remote/orders/pendingdata.dart';
// import 'package:app/data/model/ordersmodel.dart';
// import 'package:get/get.dart';

// class OrdersController extends GetxController {
//   late bool isshow;
//   List<OrdersModel> data = [];
//   PendingData pendingData = PendingData(Get.find());
//   Myservices myservices = Get.find();
//   String chooseorderpayment(String value) {
//     if (value == "1") {
//       return "card";
//     } else {
//       return "cash";
//     }
//   }

//   String chooseorderRecive(String value) {
//     if (value == "0") {
//       return "delivery";
//     } else {
//       return "recive";
//     }
//   }

//   String chooseorderStatus(String value) {
//     if (value == "0") {
//       return "wait above";
//     } else if (value == '2') {
//       return "preparing..";
//     } else {
//       return "contac us";
//     }
//   }

//   getOrdersData() async {
//     update();
//     data.clear();

//     var response = await pendingData
//         .getOrdersdata(myservices.sharedPreferences.getString("id")!);

//     if (response["status"] == "success") {
//       List listData = response['data'];
//       print("/n \n mosa mosa mosa mosa mosa mosa mosa mosa mosa======== $listData  +++++++++mosa mosa mosa mosa mosa \n mosa mosa msoa ");
//       data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
//       update();
//       isshow = false;
//       update();
//     } else {
//       Get.defaultDialog(
//           title: "no data added",
//           middleText: "try later welcom",
//           onCancel: () {
//             Get.back();
//           });
//     }
//   }

//   @override
//   void onInit() {
//     isshow = true;
//     getOrdersData();
//     super.onInit();
//   }
// }
