import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp() {
  Get.defaultDialog(
      middleText: "if you click confirm \n will exit the spp",
      backgroundColor: Colors.white,
      title: "DO YOU WANT EXIT THE APP?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('Confirm')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"))
      ]);
  return Future.value(true);
}
