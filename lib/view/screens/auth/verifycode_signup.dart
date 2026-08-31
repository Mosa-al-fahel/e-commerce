import 'package:app/controller/auth/verifycodesignup_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodeSignUpControllerImp controller =
        Get.put(VerifycodeSignUpControllerImp());

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
                        height: 75,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Enter The Verfiycode From Your Gmail",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Appcolors.grey),
                      ),

                      // const Customtextbodyauth(
                      //     textbody: "please enter the verification code"),
                      const SizedBox(
                        height: 10,
                      ),
                      OtpTextField(
                        borderRadius: BorderRadius.circular(6.5),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 228, 238, 255),
                        enabledBorderColor: Appcolors.blue,
                        fieldWidth: 54,
                        fieldHeight: 54,
                        numberOfFields: 4,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verfiycode) {
                          controller.goTosuccessignup(verfiycode);
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        Imagesasset.lock,
                        height: 240,
                        color: Appcolors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          controller.reSendCode();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 195, 223, 255),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(top: 20),
                          width: 900,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
