// ignore: file_names
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Cuadro negro superior
            Container(
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Flecha hacia atras
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () => {Navigator.of(context).pop()},
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 34,
                      ),
                    ),
                  ),
                  const Spacer(),
                  //Nombre settings
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontFamily: "",
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            //Columna de profile mas cosas
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text profile
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                    ),
                  ),
                  //Botones varios
                  SettingsEditProfileBotton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsEditProfileBotton extends StatelessWidget {
  const SettingsEditProfileBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            weight: 100,
          ),
        ],
      ),
    );
  }
}
