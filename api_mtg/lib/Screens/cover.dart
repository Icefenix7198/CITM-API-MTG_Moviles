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
        color: const Color.fromARGB(255, 24, 24, 24),
        child: const Column(
          children: [
            Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "MAGIC",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "THE GATHERING",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 50,
              child: Align(
                alignment: Alignment(0, 0.2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EnterButton(),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        "sign in",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterButton extends StatefulWidget {
  const EnterButton({
    super.key,
  });

  @override
  State<EnterButton> createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
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
