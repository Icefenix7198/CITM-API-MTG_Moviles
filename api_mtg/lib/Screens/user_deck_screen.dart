import 'package:flutter/material.dart';

class UserScreenDeck extends StatefulWidget {
  const UserScreenDeck({super.key});

  @override
  State<UserScreenDeck> createState() => _UserScreenDeckState();
}

class _UserScreenDeckState extends State<UserScreenDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 45,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 20,
                        ),
                        Expanded(
                          flex: 70,
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 80,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (int i = 0; i < 6; i++)
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                          flex: 30,
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(
                                                                "1",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          )),
                                                      Expanded(
                                                        flex: 99,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xFFF05A22),
                                                              style: BorderStyle
                                                                  .solid,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (int i = 0; i < 6; i++)
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text("${i - 1}"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 55,
            child: Container(
              color: const Color.fromARGB(246, 53, 51, 51),
            ),
          ),
        ],
      ),
    );
  }
}
