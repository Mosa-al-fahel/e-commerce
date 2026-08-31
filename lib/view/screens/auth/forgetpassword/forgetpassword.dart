import 'package:app/controller/auth/forgetpassword_controller.dart';
import 'package:app/core/functions/inputvalid.dart';
import 'package:flutter/material.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtextbodyauth.dart';
import 'package:app/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordControllerImp controller =
        Get.put(ForgetpasswordControllerImp());
    return Scaffold(
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 10),
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
                        height: 10,
                      ),
                      const Customtextbodyauth(
                          textbody: "Forget Pssword \n \nCheck your email"),
                      CustomtextformAuth(
                          isNumber: false,
                          valid: (val) {
                            return inputVlid(val!, 6, 30, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "Enter your email",
                          labeltext: "email",
                          icondata: Icons.email),
                      Text(
                        "check verify",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 22,
                            color: const Color.fromARGB(255, 3, 4, 88)),
                        textAlign: TextAlign.end,
                      ),
                      Custombuttonauth(
                        text: "Check",
                        onPressed: () {
                          controller.checkemail();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
