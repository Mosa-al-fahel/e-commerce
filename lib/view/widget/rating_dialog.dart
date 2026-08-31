import 'package:app/controller/archive-orders.dart';
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRatin(BuildContext context, String ordersid) {
  showDialog(
    useSafeArea: true,
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating your experience with us',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "HinaMincho",
            fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "HinaMincho",
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Appcolors.grey2),
      ),
      // your app's logo?
      image: Image.asset(
        "images/rating.png",
        width: 75,
        height: 75,
      ),

      submitButtonTextStyle: const TextStyle(
          fontFamily: "HinaMincho",
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Appcolors.black),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',

      enableComment: true,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrdersArchiveController controller = Get.find();
        controller.setRating(ordersid, response.rating, response.comment);
        
      },
    ),
  );
}    // show the dialog
     