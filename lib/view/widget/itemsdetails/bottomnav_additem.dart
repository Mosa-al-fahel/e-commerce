import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class BottomNavAddItem extends StatelessWidget {
  const BottomNavAddItem({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Appcolors.blue, borderRadius: BorderRadius.circular(13.5)),
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
        child: Text(
          "View cart",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 26, color: Appcolors.white, height: 1),
        ),
      ),
    );
  }
}
