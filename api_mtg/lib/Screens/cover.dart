import 'dart:io';
import 'package:api_mtg/Model/card.dart';
import 'package:api_mtg/Model/providerThing.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PortadaScreen extends StatefulWidget {
  const PortadaScreen({
    super.key,
  });

  @override
  State<PortadaScreen> createState() => _PortadaScreenState();
}

class _PortadaScreenState extends State<PortadaScreen> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      //appBar: AppBar(title: const Text("Initial Screen")),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.8),
            child: Image(
              image: AssetImage("assets/LogoImage.png"),
            ),
          ),
          Column(
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
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Text(
                            "sign in",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                        onPressed: () async {
                          final user = await OpenPopup(context);
                          if (user != null) {
                            setState(() {
                              globalInfo.name = user;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<String?> OpenPopup(BuildContext context) async {
    final TextEditingController controllerName = TextEditingController();
    final popupResult = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        title: const Text('Sing Up'),
        content: SizedBox(
          height: 140,
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
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
    controllerName.dispose();
    if (popupResult != null && popupResult == true) {
      return name;
    } else {
      return null;
    }
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
    final globalInfo = context.watch<GlobalInfo>();
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
        onPressed: () async {
          Navigator.of(context).pushNamed("/home");
          final dir = await getApplicationDocumentsDirectory();
          final file = File(
              "${dir.absolute.path}/favorite-list.json"); //Check if favorite list json exists, if it does not, create an empty one
          if (!await file.exists()) {
            saveFavoriteList(globalInfo.favoriteCards);
          }
        },
      ),
    );
  }
}
