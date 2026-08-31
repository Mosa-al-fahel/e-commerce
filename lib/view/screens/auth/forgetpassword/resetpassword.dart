import 'package:app/controller/auth/resetpassword_controller.dart';
import 'package:app/core/constant/imageasset.dart';
import 'package:app/core/functions/inputvalid.dart';
import 'package:flutter/material.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtextbodyauth.dart';
import 'package:app/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetpasswordControllerImp controller =
        Get.put(ResetpasswordControllerImp());
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
                          textbody: "Set the new password"),
                      CustomtextformAuth(
                          isNumber: false,
                          valid: (val) {
                            return inputVlid(val!, 8, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: " Enter your password",
                          labeltext: "Password",
                          icondata: Icons.password_outlined),
                      GetBuilder<ResetpasswordControllerImp>(
                        builder: (controller) => CustomtextformAuth(
                            obscureText: controller.isshow,
                            onTapicon: () {
                              controller.securepassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return inputVlid(val!, 8, 30, "password");
                            },
                            mycontroller: controller.repassword,
                            hinttext: " re Enter your password",
                            labeltext: "Password",
                            icondata: Icons.password_outlined),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        Imagesasset.safehand,
                        height: 125,
                      ),
                      Custombuttonauth(
                        text: "add",
                        onPressed: () {
                          controller.goToSuccefulResetPassword();
                          //  controller.gotoVerify();
                        },
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
