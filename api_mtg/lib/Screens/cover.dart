import 'package:flutter/material.dart';

class PortadaScreen extends StatelessWidget {
  const PortadaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Initial Screen")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to New Screen"),
          onPressed: () {
            Navigator.of(context).pushNamed("/home");
          },
        ),
      ),
    );
  }
}
