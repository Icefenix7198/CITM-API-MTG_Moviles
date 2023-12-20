import 'package:flutter/material.dart';

class UserScreenDeck extends StatefulWidget {
  const UserScreenDeck({super.key});

  @override
  State<UserScreenDeck> createState() => _UserScreenDeckState();
}

class _UserScreenDeckState extends State<UserScreenDeck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 45,
          child: Container(
            color: const Color.fromRGBO(33, 30, 30, 0.965),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 55,
          child: Container(
            color: Color.fromARGB(246, 53, 51, 51),
          ),
        ),
      ],
    );
  }
}
