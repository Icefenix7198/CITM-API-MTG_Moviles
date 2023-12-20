import 'dart:math';

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
            flex: 40,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () => {
                        {Navigator.of(context).pushNamed("/home/settings")}
                      },
                      icon: const Icon(Icons.settings, color: Colors.white),
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
                  padding: EdgeInsets.only(top: 20),
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
            flex: 60,
            child: Column(
              children: [
                const SizedBox(height: 40, width: 200,child: TabBarCards(),),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 53, 53, 53),
                   
                  ),
                ),
                const NavigatorBarra(
                  actualScreen: NavScreens.user,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarCards extends StatefulWidget {
  const TabBarCards({
    super.key,
  });

  @override
  State<TabBarCards> createState() => _TabBarCardsState();
}

class _TabBarCardsState extends State<TabBarCards>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          text: "Cards",
        ),
        Tab(
          text: "Decks",
        )
      ],
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
      height: 60,
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
              style: const TextStyle(color: Colors.white, fontSize: 20),
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
