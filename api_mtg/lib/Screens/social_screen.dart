import 'package:api_mtg/Model/Users.dart';
import 'package:api_mtg/widgets/api_users.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
//import 'package:api_mtg/widgets/api_users.dart';
import 'package:api_mtg/widgets/user_list_display.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 30, 30, 0.965),
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<User>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Loading API",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          }
          final userList = snapshot.data!;
          return Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 30,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 201, 83, 81),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Social",
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 70,
                  child: Container(
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            UsersListItem(user: userList[index]),
                            const Divider(
                              height: 0,
                              thickness: 0.12,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const NavigatorBarra(
                  actualScreen: NavScreens.social,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
