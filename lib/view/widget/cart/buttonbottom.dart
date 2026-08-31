
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ButtonBottomCart extends StatelessWidget {
  final void Function()? onTap;
  const ButtonBottomCart({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Appcolors.blue, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.only(bottom: 5, left: 95, right: 95),
        child: TextButton(
          onPressed: onTap, child: Text('Order',style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: 20, height: 1.1, color: Appcolors.white),
        ),)
          
          
      ),
    );
  }
}
