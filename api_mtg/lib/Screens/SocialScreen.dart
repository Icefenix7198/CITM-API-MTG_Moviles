import 'package:api_mtg/Model/Users.dart';
import 'package:api_mtg/widgets/API_Users.dart';
import 'package:api_mtg/widgets/UserListDisplay.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<User>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
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
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 141, 86, 50),
                        child: Align(
                          alignment: Alignment.bottomLeft,
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
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UsersListItem(user: userList[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
