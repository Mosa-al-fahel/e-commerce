import 'dart:convert';
import 'package:app/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// class Crud {
//   Future<Map?> postRequest(String linkurl, Map data) async {
//     try {
//       if (await checkinternet()) {
//         var response = await http.post(Uri.parse(linkurl), body: data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           return responsebody;
//         } else {
//           return {"status": "serv is week"};
//         }
//       } else {
//         return {"status": "week connect"};
//       }
//     } catch (e) {
//       return {"status": e};
//     }
//   }
// }

class Crud {
  
  Future<Map?> postRequest(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {

        var response = await http.post(Uri.parse(linkurl), body: data);
        

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return responsebody;
        } else {
          Get.defaultDialog(
            
            middleText: "${response.statusCode}, some thing went wrong",
            backgroundColor: Colors.white,
            title: "sorry",
          );
        }
      } else if (checkinternet() == false) {
        Get.defaultDialog(
          middleText: "not internet connection",
          backgroundColor: Colors.white,
          title: "sorry",
        );
      }
    } catch (e) {
      print("$e");
    }
    return Get.defaultDialog(
      middleText: "Wrong",
      backgroundColor: Colors.white,
      title: "sorry",
      onCancel: () => Get.back(),
    );
  }
}
