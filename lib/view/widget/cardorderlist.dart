import 'package:app/core/constant/colors.dart';
import 'package:app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';

class CardOrderList extends StatelessWidget {
  final OrdersModel ordersModel;
  final void Function()? onPressed;
  final void Function()? onDelete;
  final void Function()? onRating;
  final String status;

  const CardOrderList({
    super.key,
    required this.ordersModel,
    this.onPressed,
    this.onDelete,
    required this.status,
    this.onRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Appcolors.blue2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 248, 248, 255),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            " order number ${ordersModel.ordersId}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 28.5,
                fontWeight: FontWeight.bold,
                color: Appcolors.black),
          ),
          Text("${ordersModel.ordersDatetime}"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "orderprice        : ${ordersModel.ordersPrice}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Appcolors.grey3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "price delivery    : ${ordersModel.ordersPricedelivery}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Appcolors.grey3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                ordersModel.ordersPaymentmethod == 1
                    ? "Order payment  : done by cash"
                    : "Order payment  : done by card",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Appcolors.grey3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                ordersModel.ordersType == 1
                    ? "Order recive     : has delivered for you"
                    : "Order recive     : on hand",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Appcolors.grey3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "order status      : $status",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: Appcolors.grey3),
              ),
            ],
          ),
          const Divider(
            color: Appcolors.blue2,
            height: 12,
            thickness: 0.8,
            endIndent: 1.5,
            indent: 1.5,
          ),
          Row(
            children: [
              Text(
                "${ordersModel.ordersTotalprice}\$",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 23, fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              if (ordersModel.ordersStatus == 0)
                TextButton(
                    onPressed: onDelete,
                    child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Appcolors.white),
                            borderRadius: BorderRadius.circular(8.5),
                            color: Appcolors.blue2),
                        child: Text(
                          'Delete Order',
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 12, color: Appcolors.white),
                        ))),
            ],
          ),
          if (ordersModel.ordersStatus != 4)
            TextButton(
                onPressed: onPressed,
                child: Container(
                    alignment: Alignment.center,
                    width: 160,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Appcolors.white),
                        borderRadius: BorderRadius.circular(8.5),
                        color: Appcolors.secondblue),
                    child: Text(
                      'order details',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 18, color: Appcolors.blue),
                    ))),
          if (ordersModel.ordersStatus == 4 && ordersModel.ordersrating! == 0)
            TextButton(
                onPressed: onRating,
                child: Container(
                    alignment: Alignment.center,
                    width: 160,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Appcolors.white),
                        borderRadius: BorderRadius.circular(8.5),
                        color: Appcolors.secondblue),
                    child: Text(
                      'rating',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 18, color: Appcolors.blue),
                    ))),
          if (ordersModel.ordersStatus == 4 && ordersModel.ordersrating! > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rated ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18, color: Appcolors.grey2),
                ),
                ...List.generate(
                    ordersModel.ordersrating!,
                    (index) => const Icon(
                          Icons.star,
                          color: Appcolors.grey2,
                        ))
              ],
            )
        ],
      ),
    );
  }
}

// class CardOrdersList extends StatelessWidget {
//   final String orderid;
//   final String orderprice;
//   final String orderdeliveryprice;
//   final String orderpaymethod;
//   final String orderwayrecive;
//   final String ordertotalprice;
//   final void Function()? onPressed;

//   const CardOrdersList({
//     super.key,
//     required this.orderid,
//     required this.orderdeliveryprice,
//     required this.orderprice,
//     required this.orderpaymethod,
//     required this.orderwayrecive,
//     required this.ordertotalprice,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//       decoration: BoxDecoration(
//           border: Border.all(width: 0.5, color: Appcolors.blue2),
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           gradient: const LinearGradient(colors: [
//             Color.fromARGB(255, 248, 248, 255),
//             Color.fromARGB(255, 255, 255, 255),
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             orderid,
//             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                 fontSize: 28.5,
//                 fontWeight: FontWeight.bold,
//                 color: Appcolors.black),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Text(
//                 orderprice,
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w100,
//                     color: Appcolors.grey3),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 orderdeliveryprice,
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w100,
//                     color: Appcolors.grey3),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 orderpaymethod,
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w100,
//                     color: Appcolors.grey3),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 orderwayrecive,
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w100,
//                     color: Appcolors.grey3),
//               ),
//             ],
//           ),
//           const Divider(
//             color: Appcolors.blue2,
//             height: 12,
//             thickness: 0.8,
//             endIndent: 1.5,
//             indent: 1.5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "$ordertotalprice\$",
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyLarge!
//                     .copyWith(fontSize: 23, fontWeight: FontWeight.w900),
//               ),
//               const Spacer(),
//               TextButton(
//                   onPressed: onPressed,
//                   child: Container(
//                       alignment: Alignment.center,
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 0.5, color: Appcolors.white),
//                           borderRadius: BorderRadius.circular(8.5),
//                           color: Appcolors.secondblue),
//                       child: Text(
//                         'order details',
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyLarge!
//                             .copyWith(fontSize: 18, color: Appcolors.blue),
//                       )))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

