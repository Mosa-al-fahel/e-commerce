import 'package:flutter/material.dart';

class CustomHomeText extends StatelessWidget {
  final String texthome;

  const CustomHomeText({super.key, required this.texthome});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(12, 195, 249, 249),
            Color.fromARGB(11, 0, 103, 194),
          ], end: Alignment.centerRight, begin: Alignment.centerLeft)),
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Text(
        textAlign: TextAlign.start,
        texthome,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 29.5, color: const Color.fromARGB(255, 3, 50, 86)),
      ),
    );
  }
}
