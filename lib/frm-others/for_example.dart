import 'package:flutter/material.dart';

void main() async {
  runApp(const exam());
}

class exam extends StatefulWidget {
  const exam({super.key});

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            initialIndex: 3,
            animationDuration: const Duration(milliseconds: 200),
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Animation"),
                bottom: const TabBar(
                    padding: EdgeInsets.all(0),
                    indicatorWeight: 0.1,
                    dividerHeight: 0,
                    indicatorColor: Colors.black,
                    dividerColor: Colors.white,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.abc),
                      ),
                      Tab(
                        icon: Icon(Icons.abc),
                      ),
                      Tab(
                        icon: Icon(Icons.abc),
                      ),
                      Tab(
                        icon: Icon(Icons.abc),
                      ),
                    ]),
              ),
              body: Center(
                child: TabBarView(children: [
                  Container(
                    color: const Color.fromARGB(255, 255, 162, 162),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 255, 0, 0),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 198, 255, 119),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 138, 69, 229),
                  ),
                ]),
              ),
            )));
  }
}
