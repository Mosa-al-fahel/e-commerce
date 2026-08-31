// ignore_for_file: deprecated_member_use
import 'package:app/controller/auth/signup_controller.dart';
import 'package:app/core/functions/exitalert.dart';
import 'package:app/core/functions/inputvalid.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtextbodyauth.dart';
import 'package:app/view/widget/auth/customtextformauth.dart';
import 'package:app/view/widget/auth/customtextsignuporlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpcontrollerImp controller = Get.put(SignUpcontrollerImp());
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertexitapp,
            child: Form(
              key: controller.formstate,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Expanded(child:
                        GetBuilder<SignUpcontrollerImp>(builder: (controller) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22))),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            //const Customtexttitleauth(texttitle: "Welcom back"),
                            const Customtextbodyauth(
                                textbody:
                                    "Continue with your email and \n your password or with \n social media"),

                            CustomtextformAuth(
                          
                                isNumber: false,
                                valid: (val) {
                                  return inputVlid(val!, 6, 30, "username");
                                },
                                mycontroller: controller.username,
                                hinttext: "Enter your name",
                                labeltext: "name",
                                icondata: Icons.person),

                            CustomtextformAuth(
                                isNumber: true,
                                valid: (val) {
                                  return inputVlid(val!, 8, 30, "phonenumber");
                                },
                                mycontroller: controller.phonenumber,
                                hinttext: "Enter your number",
                                labeltext: "number",
                                icondata: Icons.phone_android),

                            CustomtextformAuth(
                                isNumber: false,
                                valid: (val) {
                                  return inputVlid(val!, 6, 30, "email");
                                },
                                mycontroller: controller.email,
                                hinttext: "Enter your email",
                                labeltext: "email",
                                icondata: Icons.email),

                            GetBuilder<SignUpcontrollerImp>(
                                builder: (controller) {
                              return CustomtextformAuth(
                                  onTapicon: () {
                                    controller.securepassword();
                                  },
                                  obscureText: controller.isshow,
                                  isNumber: false,
                                  valid: (val) {
                                    return inputVlid(val!, 6, 30, "password");
                                  },
                                  mycontroller: controller.password,
                                  hinttext: "Enter your Password",
                                  labeltext: "Password",
                                  icondata: Icons.lock_open_rounded);
                            }),

                            const SizedBox(
                              height: 20,
                            ),

                            InkWell(
                                onTap: () {
                                  controller.signup();
                                },
                                child: const Custombuttonauth(text: "Signup")),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomSignuporLogin(
                              textone: "Do you have an account?",
                              texttwo: " Login",
                              onTap: () {
                                controller.goToLogin();
                              },
                            )
                          ],
                        ),
                      );
                    })),
                  ],
                ),
              ),
            )));
  }
}
