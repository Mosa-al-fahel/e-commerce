import 'package:app/controller/onboarding_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Customdotcontroller extends StatelessWidget {
  const Customdotcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboardingcontrollerimp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(Onboardinglist.length, (index) {
            return AnimatedContainer(
              margin: const EdgeInsets.only(left: 2.9, right: 2.9, bottom: 20),
              duration: const Duration(milliseconds: 800),
              width: controller.currentpage == index ? 23 : 7,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: controller.currentpage == index
                      ? Appcolors.blue
                      : const Color.fromARGB(255, 70, 97, 255)),
            );
          })
        ],
      );
    });
  }
}
