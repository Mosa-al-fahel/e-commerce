import 'package:flutter/material.dart';

class CustomButtonBottomBar extends StatelessWidget {
  const CustomButtonBottomBar({
    super.key,
    required this.onPressed,
    required this.iconButton,
    required this.textButton,
    required this.active,
  });
  final void Function()? onPressed;
  final IconData iconButton;
  final String textButton;

  final bool active;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconButton,
              color: active
                  ? const Color.fromARGB(255, 237, 237, 241)
                  : const Color.fromARGB(255, 0, 0, 0),
              size: active ? 28 : 22,
            ),
            Text(textButton,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: active ? 15.5 : 14,
                      color: active
                          ? Colors.white
                          : const Color.fromARGB(255, 0, 0, 0),
                    ))
          ],
        ));
  }
}
