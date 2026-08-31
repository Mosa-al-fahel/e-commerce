import 'package:flutter/material.dart';

class Animat2 extends StatefulWidget {
  const Animat2({super.key});
  @override
  State<Animat2> createState() => _Animat2State();
}

class _Animat2State extends State<Animat2> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> turns;

  late Animation<AlignmentGeometry> alignment;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    alignment = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(animationController);
    turns = Tween<double>(begin: 0.0, end: 2.2).animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 125, 117, 93),
              child: Center(
                child: AlignTransition(
                    alignment: alignment,
                    child: RotationTransition(
                      turns: turns,
                      child:
                          Container(color: Colors.black, width: 45, height: 45),
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.green,
              height: 22,
            ),
          ],
        ));
  }
}
/*  Container(
                          child: Text(
                            "mosa",
                          const   style: TextStyle(
                                color: Colors.white,
                                fontSize: animationController.value / 10),
                          ),
                          color: Colors.black,
                          width: animationController.value,
                          height: animationController.value,
                        ), */