import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Custombuttonlang extends StatelessWidget {
  final String stringbotton;
  final void Function()? onPressed;
  const Custombuttonlang(
      {super.key, required this.stringbotton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 96),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1))),
      child: MaterialButton(
        color: Appcolors.blue,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          stringbotton,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
