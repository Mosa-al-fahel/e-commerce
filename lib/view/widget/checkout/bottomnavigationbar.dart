import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class BottomNavcheckout extends StatelessWidget {
  final void Function()? onPressed;

  const BottomNavcheckout({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 110, right: 110, top: 8),
      decoration: BoxDecoration(
          color: Appcolors.blue, borderRadius: BorderRadius.circular(12.2)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          "CheckOut",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: 17, color: Appcolors.white),
        ),
      ),
    );
  }
}
