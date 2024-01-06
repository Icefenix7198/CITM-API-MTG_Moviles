import 'package:api_mtg/widgets/TabBarCards.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 10, 10, 10),
      body: Column(
        children: [
          Expanded(
            flex: 42,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: IconButton(
                      onPressed: () => {
                        {Navigator.of(context).pushNamed("/home/settings")}
                      },
                      icon: const Icon(Icons.settings,
                          color: Colors.white, size: 25),
                    ),
                  ),
                ),
                const Icon(
                  Icons.account_circle,
                  color: Colors.white60,
                  size: 65,
                ),
                const Text(
                  "Name",
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  "username",
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158), fontSize: 12),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: BoxInfo(
                          num: 10,
                          text: "followers",
                        ),
                      ),
                      BoxInfo(
                        num: 10,
                        text: "following",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 58,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: SizedBox(
                      height: 35,
                      width: 150,
                      child: TabBar(
                        labelColor: Colors.white,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        indicatorColor: Colors.red,
                        tabs: [Tab(text: "Cards"), Tab(text: "Decks")],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 53, 53, 53),
                      child: const TabBarView(
                        children: <Widget>[
                          Text(
                            "Wee",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Woo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BoxInfo extends StatelessWidget {
  const BoxInfo({
    super.key,
    required this.num,
    required this.text,
  });
  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 53,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 53, 53, 53),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: Text(
              "$num",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

