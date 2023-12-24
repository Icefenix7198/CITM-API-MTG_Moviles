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
          return _SearchableList(userList: userList);
        },
      ),
    );
  }
}

class _SearchableList extends StatefulWidget {
  const _SearchableList({
    super.key,
    required this.userList,
  });

  final List<User> userList;

  @override
  State<_SearchableList> createState() => _SearchableListState();
}

class _SearchableListState extends State<_SearchableList> {
  final controller = TextEditingController();
  late List<User> filteredList;

  @override
  void initState() {
    filteredList = List.from(widget.userList);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Row(
            children: [
              Expanded(
                flex: 70,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "My Chats",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 30,
                child: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 102, 101, 101),
                    borderRadius: BorderRadius.all(Radius.circular((16)))),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(Icons.search_rounded,
                              size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 80,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: controller,
                            onChanged: (_) {
                              setState(() {
                                final search = controller.text.toLowerCase();
                                filteredList = widget.userList
                                    .where((user) =>
                                        user.firstName
                                            .toLowerCase()
                                            .contains(search) ||
                                        user.secondName
                                            .toLowerCase()
                                            .contains(search))
                                    .toList();
                              });
                            },
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Search Contacts",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 60,
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  UsersListItem(user: filteredList[index]),
                  const Divider(
                    height: 0,
                    thickness: 0.12,
                  ),
                ],
              );
            },
          ),
        ),
        const NavigatorBarra(
          actualScreen: NavScreens.social,
        ),
      ],
    );
  }
}
