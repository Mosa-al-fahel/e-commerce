import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  const Custombuttonauth({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Appcolors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
          )),
    );
  }
}
