import 'package:app/controller/onboarding_controller.dart';
import 'package:app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Customslider extends GetView<Onboardingcontrollerimp> {
  const Customslider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      
      },
      itemCount: Onboardinglist.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 7, right: 1, left: 1),
              child: Text(
                "${Onboardinglist[index].titel}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  width: 300,
                  height: 270,
                  "${Onboardinglist[index].image}",
                  fit: BoxFit.fill,
                )),
            // Spacer(),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${Onboardinglist[index].body}",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
