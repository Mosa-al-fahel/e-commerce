import 'dart:io';
import 'package:app/binding/initialbinding.dart';
import 'package:app/core/constant/apptheme.dart';
import 'package:app/core/localization/changelocal.dart';
import 'package:app/core/localization/translation.dart';
import 'package:app/core/services/services.dart';
import 'package:app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await initialservice();
  Platform.isAndroid

      ? await Firebase.initializeApp()
      : await Firebase.initializeApp();
  // ignore: unused_local_variable
  
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocaleController controller = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      locale: controller.language,
      translations: Mytranslation(),

      initialBinding: InitialBinding(),
      theme: apptheme,
      debugShowCheckedModeBanner: false,

      //routes: routes,
      getPages: routes,
    );
  }
}
