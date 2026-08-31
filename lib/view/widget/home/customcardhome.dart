import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String titlecardhome;
  final String bodycardhome;

  const CustomCardHome(
      {super.key, required this.titlecardhome, required this.bodycardhome});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      alignment: Alignment.center,
      height: 160,
      decoration: BoxDecoration(

          ///the last  const Color.fromARGB(255, 25, 47, 148),

          gradient: const LinearGradient(colors: [
            Color.fromARGB(174, 29, 65, 207),
            //   Color.fromARGB(255, 7, 38, 122)
            Color.fromARGB(255, 4, 14, 199)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        title: Text(
          textAlign: TextAlign.start,
          titlecardhome,
          style: const TextStyle(
              color: Color.fromARGB(255, 226, 219, 255),
              fontSize: 33,
              fontWeight: FontWeight.w400),
        ),
        isThreeLine: true,
        subtitle: Text(
          textAlign: TextAlign.start,
          bodycardhome,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                //  fontWeight: FontWeight.w200,
                fontSize: 33,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
        ),
      ),
    );
  }
}
