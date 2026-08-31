import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Titletext extends StatelessWidget {
  final String titletext;
  const Titletext({super.key, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return Text(
      titletext,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontSize: 23, color: Appcolors.blue2),
    );
  }
}
