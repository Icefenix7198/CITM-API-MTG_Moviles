import 'package:flutter/material.dart';

class PortadaScreen extends StatelessWidget {
  const PortadaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Initial Screen")),
      body: Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MAGIC",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Align(
                alignment: Alignment(0, -1.5),
                child: Text(
                  "THE GATHERING",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              EnterButton(),
              Text(
                "sign in",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      height: 40.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 0.5,
            color: Colors.red,
          ),
          shape: const BeveledRectangleBorder(),
        ),
        child: const Text(
          "ENTER",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/home");
        },
      ),
    );
  }
}
