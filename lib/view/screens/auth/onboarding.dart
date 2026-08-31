import 'package:app/controller/onboarding_controller.dart';
import 'package:app/view/widget/onboarding/custom-dotcontroller.dart';
import 'package:app/view/widget/onboarding/custombutton.dart';
import 'package:app/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardingcontrollerimp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        child: const Column(
          children: [
            // Expanded(flex: 3, child:
            Expanded(child: Customslider()),

            // flex: 1,
            Column(
              children: [
                Customdotcontroller(),
                Custuombutton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
