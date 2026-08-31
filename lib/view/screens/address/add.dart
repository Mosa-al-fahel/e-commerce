import 'package:app/controller/address/address_add_controller.dart';
import 'package:app/view/widget/auth/custombuttonauth.dart';
import 'package:app/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AdressAddController controller = Get.put(AdressAddController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('add your Adress'),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Form(
            key: controller.formstate,
            child: Center(
                child: ListView(
              children: [
                CustomtextformAuth(
                    mycontroller: controller.city,
                    hinttext: "whats the city",
                    labeltext: "city",
                    icondata: Icons.location_city,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                CustomtextformAuth(
                    mycontroller: controller.name,
                    hinttext: "whats the name",
                    labeltext: "name",
                    icondata: Icons.online_prediction_sharp,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                CustomtextformAuth(
                    mycontroller: controller.street,
                    hinttext: "whats the street",
                    labeltext: "street",
                    icondata: Icons.stream_outlined,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Custombuttonauth(
                      text: "done",
                      onPressed: () {
                        controller.addressAdd();
                      },
                    ))
              ],
            )),
          ),
        ));
  }
}
