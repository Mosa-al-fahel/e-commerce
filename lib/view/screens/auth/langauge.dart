import 'package:app/core/constant/routes.dart';
import 'package:app/core/localization/changelocal.dart';
import 'package:app/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose language",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Custombuttonlang(
                stringbotton: "ar",
                onPressed: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoute.onboarding);
                }),
            const SizedBox(
              height: 10,
            ),
            Custombuttonlang(
                stringbotton: "en",
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoute.onboarding);
                }),
          ],
        ),
      ),
    );
  }
}
