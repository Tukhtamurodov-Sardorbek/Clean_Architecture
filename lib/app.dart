import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Clean Architecture'),
      ),
      body: ColoredBox(
        color: Colors.blueGrey.shade300,
      ),
    );
  }
}
