import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomtextformAuth extends StatelessWidget {
  const CustomtextformAuth(
      {super.key,
      this.onTapicon,
      this.obscureText,
      required this.hinttext,
      required this.labeltext,
      required this.icondata,
      this.mycontroller,
      required this.valid,
      required this.isNumber});
  final String hinttext;
  final String labeltext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapicon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.4, horizontal: 24),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          suffixIcon: InkWell(onTap: onTapicon, child: Icon(icondata)),
          hintText: hinttext,
          label: Text(labeltext),
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 187, 187, 187)),
          labelStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 23, color: const Color.fromARGB(255, 151, 151, 151)),
        ),
      ),
    );
  }
}
