import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hub")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Init"),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
      ),
    );
  }
}
