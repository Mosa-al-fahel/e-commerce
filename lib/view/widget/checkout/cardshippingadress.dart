import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardShippingAdress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool active;
  final void Function()? onTap2;

  const CardShippingAdress(
      {super.key,
      required this.title,
      required this.active,
      required this.subtitle, required this.onTap2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap2,
      child: Card(
          color: active ? Appcolors.blue : Appcolors.white,
          child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 24,
                  color: active ? Appcolors.white : Appcolors.blue,
                  height: 1.6,
                  fontWeight: FontWeight.w600),
            ),
            isThreeLine: true,
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 15,
                  color: active ? Appcolors.grey : Appcolors.grey2,
                  height: 1.6,
                  fontWeight: FontWeight.w100),
            ),
          )),
    );
  }
}
