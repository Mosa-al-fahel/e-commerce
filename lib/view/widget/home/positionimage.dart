import 'package:flutter/material.dart';

class PositionImage extends StatelessWidget {
  const PositionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -50,
        right: -60.5,
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(0, 172, 171, 246),
                Color.fromARGB(154, 4, 9, 112),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadiusDirectional.circular(200)),
          height: 155,
          width: 155,
          child: Image.asset(
            "images/sell2.png",
          ),
        ));
  }
}
