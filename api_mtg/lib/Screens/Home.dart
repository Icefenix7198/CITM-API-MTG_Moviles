// ignore: file_names
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 201, 83, 81),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text("Go API"),
              onPressed: () {
                Navigator.of(context).pushNamed("/home/api");
              },
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text("Go to Social"),
              onPressed: () {
                Navigator.of(context).pushNamed("/home/social");
              },
            ),
            const Spacer(),
            const NavigatorBarra(
              actualScreen: NavScreens.home,
            ),
          ],
        ),
      ),
    );
  }
}
