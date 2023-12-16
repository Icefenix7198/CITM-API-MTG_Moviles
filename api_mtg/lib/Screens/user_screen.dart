import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(33, 30, 30, 0.965),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white60,
                ),
              )),
          Icon(
            Icons.account_circle,
            color: Colors.white60,
            size: 50,
          ),
          Text(
            "Name",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "username",
            style: TextStyle(
                color: Color.fromARGB(255, 158, 158, 158), fontSize: 12),
          ),
          Padding(
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
          Spacer(),
          NavigatorBarra(
            actualScreen: NavScreens.user,
          )
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
