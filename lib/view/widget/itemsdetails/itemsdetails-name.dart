import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ItemsDetailsName extends StatelessWidget {
  const ItemsDetailsName(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontSize: 26, color: Appcolors.blue2),
    );
  }
}
