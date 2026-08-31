import 'package:app/controller/auth/successignup_controller.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesSignUp extends StatelessWidget {
  const SuccesSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SuccesSignUpControllerImp controller = Get.put(SuccesSignUpControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Customtexttitleauth(texttitle: "SuccesSignUp"),
                    Text("now you can do safe using for ecommerce",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color.fromARGB(255, 143, 143, 143))),
                    const SizedBox(
                      height: 85,
                    ),
                    Custombuttonauth(
                      text: "Go to login",
                      onPressed: () {
                        controller.goToLoginPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
