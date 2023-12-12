import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hub")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Init"),
          onPressed: () {
            Navigator.of(context).pushNamed("/home/api");
          },
        ),
      ),
    );
  }
}
