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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Go API"),
              onPressed: () {
                Navigator.of(context).pushNamed("/home/api");
              },
            ),
            ElevatedButton(
              child: Text("Go to Social"),
              onPressed: () {
                Navigator.of(context).pushNamed("/home/social");
              },
            ),
          ],
        ),
      ),
    );
  }
}
