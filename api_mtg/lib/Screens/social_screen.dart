import 'package:api_mtg/Model/Users.dart';
import 'package:api_mtg/Model/providerThing.dart';
import 'package:api_mtg/widgets/api_users.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
//import 'package:api_mtg/widgets/api_users.dart';
import 'package:api_mtg/widgets/user_list_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<User>> snapshot,
        ) {
          if (!snapshot.hasData) {
            final globalInfo = context.watch<GlobalInfo>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      (globalInfo.language == Idioma.spanish)
                          ? "Cargando API"
                          : (globalInfo.language == Idioma.catalan)
                              ? "Carregant API"
                              : "Loading API",
                      style: TextStyle(
                          color: (globalInfo.darkMode)
                              ? Colors.white
                              : Colors.black),
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
  late List<User> userList;
  late List<User> filteredList;

  @override
  void initState() {
    userList = List.from(widget.userList);
    filteredList = List.from(userList);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        (globalInfo.language == Idioma.spanish)
                            ? "Conversaciones"
                            : (globalInfo.language == Idioma.catalan)
                                ? "Conversas"
                                : "My Chats",
                        style: TextStyle(
                            fontSize: 40,
                            color: (globalInfo.darkMode)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 30,
                child: Icon(
                  Icons.chat_bubble,
                  color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
            child: Container(
              decoration: BoxDecoration(
                  color: (globalInfo.darkMode)
                      ? Color.fromARGB(255, 101, 101, 101)
                      : Color.fromARGB(255, 161, 161, 161),
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(Icons.search_rounded,
                            size: 40,
                            color: (globalInfo.darkMode)
                                ? Colors.white
                                : Colors.black),
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
                            setState(updateFilteredList);
                          },
                          cursorColor: (globalInfo.darkMode)
                              ? Colors.white
                              : Colors.black,
                          style: TextStyle(
                              color: (globalInfo.darkMode)
                                  ? Colors.white
                                  : Colors.black),
                          decoration: InputDecoration(
                            hintText: (globalInfo.language == Idioma.spanish)
                                ? "Buscar Contactos"
                                : (globalInfo.language == Idioma.catalan)
                                    ? "Buscar Contactes"
                                    : "Search Contacts",
                            hintStyle: TextStyle(
                                color: (globalInfo.darkMode)
                                    ? Colors.white
                                    : Colors.black),
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
        Expanded(
          flex: 60,
          child: Stack(
            children: [
              ListView.builder(
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
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red.shade400, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () async {
                      final user = await OpenPopup(context);
                      if (user != null) {
                        setState(() {
                          userList.add(user);
                          updateFilteredList();
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const NavigatorBar(
          actualScreen: NavScreens.social,
        ),
      ],
    );
  }

  void updateFilteredList() {
    final search = controller.text.toLowerCase();
    filteredList = userList
        .where((user) =>
            user.firstName.toLowerCase().contains(search) ||
            user.secondName.toLowerCase().contains(search))
        .toList();
  }

  // ignore: non_constant_identifier_names
  Future<User?> OpenPopup(BuildContext context) async {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerSecondName = TextEditingController();
    final popupResult = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        title: const Text('Add User'),
        content: SizedBox(
          height: 170,
          child: Column(
            children: [
              const Text('Fill user Data'),
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: controllerSecondName,
                decoration: const InputDecoration(
                  labelText: 'Second Name',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Create'),
          ),
        ],
      ),
    );
    String name = controllerName.text;
    String secondName = controllerSecondName.text;
    controllerName.dispose();
    controllerSecondName.dispose();
    if (popupResult != null && popupResult == true) {
      return User(name, secondName, "assets/IconsUser4.png");
    } else {
      return null;
    }
  }
}
