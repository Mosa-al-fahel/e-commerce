import 'package:flutter/material.dart';

class Customtextbodyauth extends StatelessWidget {
  final String textbody;

  const Customtextbodyauth({super.key, required this.textbody});
  @override
  Widget build(BuildContext context) {
    return Text(
      textbody,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 129, 129, 129)),
      textAlign: TextAlign.center,
    );
  }
}
