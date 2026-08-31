import 'package:flutter/material.dart';

class SDF extends StatefulWidget {
  const SDF({super.key});

  @override
  _SDFState createState() => _SDFState();
}

class _SDFState extends State<SDF> {
  int body = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("I Am AppBar"),
        actions: getActions(body),
      ),
      body: getBody(body), //here you can add your body
    );
  }

  getBody(int body) {
    switch (body) {
      case 0:
        return Container(); // Home Screen

      case 1:
        return Container(); // Settings Screen
    }
  }

  getActions(int body) {
    switch (body) {
      case 0:
        return [
          const Icon(Icons.settings),
          const Icon(Icons.home),
        ]; // Home Screen

      case 1:
        return [
          const Icon(Icons.home),
          const Icon(Icons.settings),
        ]; // Settings Screen
    }
  }
}
