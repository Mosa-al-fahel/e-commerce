import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardPayMethod extends StatelessWidget {
  final String title;
  final bool active;

  const CardPayMethod({super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: active ? Appcolors.blue : Appcolors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 23,
            color: active ? Appcolors.white : Appcolors.blue,
            height: 1.6,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
