// ignore: file_names
import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Customcardsetting extends StatelessWidget {
  const Customcardsetting({super.key, this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        
        shadowColor: Appcolors.secondblue,
        color: Appcolors.white,
        child: ListTile(
          title: Container(
            padding: const EdgeInsets.all(4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 25, color: Appcolors.black),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          ),
        ),
      ),
    );
  }
}
