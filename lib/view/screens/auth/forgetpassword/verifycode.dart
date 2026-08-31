import 'package:app/controller/auth/verifycode_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:app/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodeControllerImp controller = Get.put(VerifycodeControllerImp());

    return Scaffold(
      body: Form(
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
                        height: 55,
                      ),
                      const Customtextbodyauth(textbody: "Verification Code"),
                      const Customtextbodyauth(
                          textbody: "please enter the verification code"),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        borderRadius: BorderRadius.circular(6.5),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 232, 232, 232),
                        enabledBorderColor: Appcolors.blue,
                        fieldWidth: 40,
                        fieldHeight: 46,
                        numberOfFields: 4,

                        //set to true to show as box or false to show as dash

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToResetpassword(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "we are carful to protect \n your data",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 40, left: 40),
                              child: Image.asset(
                                Imagesasset.network,
                                height: 290,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.reSendCode();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 197, 222, 255),
                                    borderRadius: BorderRadius.circular(13)),
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    "re send verify code",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Appcolors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
