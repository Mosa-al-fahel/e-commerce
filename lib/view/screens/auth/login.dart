import 'package:app/controller/auth/login_controller.dart';
import 'package:app/core/constant/imageasset.dart';
import 'package:app/core/functions/exitalert.dart';
import 'package:app/core/functions/inputvalid.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtextbodyauth.dart';
import 'package:app/view/widget/auth/customtextformauth.dart';
import 'package:app/view/widget/auth/customtextsignuporlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertexitapp,
      child: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22))),
                  child: ListView(
                    children: [
                      Image.asset(
                        Imagesasset.logopng,
                        height: 285,
                        width: 300,
                      ),

                      //const Customtexttitleauth(texttitle: "Welcom back"),
                      const Customtextbodyauth(
                          textbody: "Continue with \n your email & password"),

                      CustomtextformAuth(
                          isNumber: false,
                          valid: (val) {
                            return inputVlid(val!, 11, 100, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "Enter your email",
                          labeltext: "email",
                          icondata: Icons.email),
                          
                      GetBuilder<LogincontrollerImp>(
                        builder: (controller) => CustomtextformAuth(
                            onTapicon: () {
                              controller.securepassword();
                            },
                            obscureText: controller.isshow,
                            isNumber: false,
                            valid: (val) {
                              return inputVlid(val!, 8, 40, "password");
                            },
                            mycontroller: controller.password,
                            hinttext: "Enter your Password",
                            labeltext: "Password",
                            icondata: Icons.lock_open_rounded),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassowrd();
                        },
                        child: Text(
                          "forget password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 22,
                                  color: const Color.fromARGB(255, 3, 4, 88)),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Custombuttonauth(
                        text: "Login",
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      CustomSignuporLogin(
                        textone: "Dont have an account?",
                        texttwo: " Sign up",
                        onTap: () {
                          controller.goToSignUp();
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
    ));
  }
}
