import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSignuporLogin extends StatelessWidget {
  final String textone;
  final void Function()? onTap;
  final String texttwo;

  const CustomSignuporLogin(
      {super.key, required this.textone, required this.texttwo, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 20, color: Appcolors.blue),
          ),
        )
      ],
    );
  }
}
