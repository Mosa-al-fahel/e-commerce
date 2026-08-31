import 'package:app/controller/setting_controller.dart';
import 'package:app/core/constant/colors.dart';
import 'package:app/core/constant/routes.dart';
import 'package:app/view/widget/customcard-setting.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    // set up the buttons

    return Material(
      child: Container(
        color: Appcolors.white,
        child: ListView(
          children: [
            // Stack(
            //   alignment: Alignment.center,
            //   clipBehavior: Clip.none,
            //   children: [
            // Container(
            //   decoration: const BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Color.fromRGBO(82, 154, 255, 1),
            //     Appcolors.blue,
            //   ])),
            //   padding: const EdgeInsets.all(55),
            //   alignment: Alignment.topCenter,
            //   width: double.infinity,
            //   height: Get.width / 2,
            // ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  backgroundColor: Appcolors.white,
                  maxRadius: 60,
                  child: Image.asset(
                    "images/setting.png",
                    // height: 250,
                    // width: 250,
                  ),
                )),

            //  ],
            //),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(66, 84, 195, 255),
                  color: Appcolors.secondblue,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "setting",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 40, color: Appcolors.black, height: 1.1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customcardsetting(
                    text: "order Pending",
                    onTap: () {
                      Get.offNamed(AppRoute.ordersPending);
                    },
                  ),
                  Customcardsetting(
                    text: "archive",
                    onTap: () {
                      Get.offNamed(AppRoute.orderarchive);
                    },
                  ),
                  Customcardsetting(
                    text: "location",
                    onTap: () {
                      Get.offNamed(AppRoute.addressView);
                    },
                  ),
                  Customcardsetting(
                    text: "contact us",
                    onTap: () {
                      launchUrl(Uri.parse("tel:+963 997 572 901"));
                    },
                  ),
                  Customcardsetting(
                    text: "logout",
                    onTap: () {
                      Get.offNamed(controller.loGout());
                    },
                  ),
                  Customcardsetting(
                    text: "Notifications",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                AwesomeDialog(
                  transitionAnimationDuration: Durations.long1,
                  //      barrierColor: Color.fromARGB(219, 81, 119, 255),
                  title: "Hello",
                  headerAnimationLoop: false,
                  reverseBtnOrder: false,
                  dismissOnBackKeyPress: true,
                  btnOkColor: Appcolors.blue,
                  dialogType: DialogType.success,
                  body: Text(
                    " i am a programmer mosa\nand this my first application \nyou can talk to me for help",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 22, color: Appcolors.grey2),
                  ),
                  animType: AnimType.scale,
                  context: context,
                  btnOk: Text(
                    "good luck",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  btnCancelColor: Appcolors.blue,
                  btnOkOnPress: () {},
                ).show();
              },
              child: Text(
                textAlign: TextAlign.center,
                "Know more about us?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 19, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
