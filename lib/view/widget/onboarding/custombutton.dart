import 'package:app/controller/onboarding_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Custuombutton extends GetView<Onboardingcontrollerimp> {
  const Custuombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0.5),
      margin: const EdgeInsets.only(left: 223, bottom: 20),
      decoration: BoxDecoration(
          color: Appcolors.blue,
          border: Border.all(
              color: const Color.fromARGB(255, 22, 18, 100), width: 0.3),
          borderRadius: BorderRadius.circular(11)),
      child: TextButton(
        child: const Text("NEXT",
            style: TextStyle(
                color: Color.fromARGB(255, 223, 223, 223),
                fontFamily: "HinaMincho",
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          controller.next();
        },
      ),
    );
  }
}
