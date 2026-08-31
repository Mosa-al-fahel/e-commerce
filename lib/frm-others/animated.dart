import 'package:app/frm-others/animetion2.dart';
import 'package:flutter/material.dart';

class Animat extends StatefulWidget {
  const Animat({super.key});
  @override
  State<Animat> createState() => _AnimatState();
}

class _AnimatState extends State<Animat> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double begin = 0.5;
  double end = 0.5;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 200.0,
      upperBound: 290.0,
    );
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
            Center(
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return InkWell(
                        onTap: () => animationController.forward(),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          width: animationController.value,
                          height: animationController.value,
                          child: Text(
                            "TAP TO START",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: animationController.value / 10),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                        "this Widget will not effect in animation"))),
            MaterialButton(
              onPressed: () {
                animationController.stop();
              },
              child: const Text('TAP TO STOP'),
            ),
            TweenAnimationBuilder(
              //curve: Curves.bounceIn,
              // curve: Curves.bounceInOut,
              curve: Curves.fastEaseInToSlowEaseOut,
              tween: Tween(begin: begin, end: end),
              duration: const Duration(seconds: 2),
              builder: (context, values, child) {
                return Transform.scale(
                  scale: values,
                  origin: const Offset(20, 90),
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    color: Colors.purple,
                    child: const Text(
                      "DARK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  begin = 1.0;
                  end = 1.2;
                });
              },
              child: const Icon(Icons.circle),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Animat2();
                }));
              },
              child: const Text("Move To page 2"),
            )
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