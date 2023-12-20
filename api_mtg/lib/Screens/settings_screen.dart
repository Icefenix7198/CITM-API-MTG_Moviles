// ignore: file_names
import 'package:flutter/material.dart';

enum SettingsMenus {
  none,
  editProfile,
  accountManagment,
  visibility,
  notifications,
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsMenus openedOption = SettingsMenus.none;

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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text profile
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                    ),
                  ),
                  //Botones varios
                  SettingsEditProfileBotton(
                    open: openedOption == SettingsMenus.editProfile,
                    onPressed: () {
                      setState(() {
                        openedOption = openedOption == SettingsMenus.editProfile
                            ? SettingsMenus.none
                            : SettingsMenus.editProfile;
                      });
                    },
                  ),
                  SettingsAccountManagmentBotton(
                    open: openedOption == SettingsMenus.accountManagment,
                    onPressed: () {
                      setState(() {
                        openedOption =
                            openedOption == SettingsMenus.accountManagment
                                ? SettingsMenus.none
                                : SettingsMenus.accountManagment;
                      });
                    },
                  ),
                  SettingsVisibilityBotton(
                    open: openedOption == SettingsMenus.visibility,
                    onPressed: () {
                      setState(() {
                        openedOption = openedOption == SettingsMenus.visibility
                            ? SettingsMenus.none
                            : SettingsMenus.visibility;
                      });
                    },
                  ),
                  SettingsNotificationsBotton(
                    open: openedOption == SettingsMenus.notifications,
                    onPressed: () {
                      setState(() {
                        openedOption =
                            openedOption == SettingsMenus.notifications
                                ? SettingsMenus.none
                                : SettingsMenus.notifications;
                      });
                    },
                  ),
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
  SettingsEditProfileBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: open
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    weight: 100,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    weight: 100,
                  ),
          ),
        ],
      ),
    );
  }
}

class SettingsAccountManagmentBotton extends StatelessWidget {
  const SettingsAccountManagmentBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Icon(
            Icons.manage_accounts_outlined,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Account Managment",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: open
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    weight: 100,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    weight: 100,
                  ),
          ),
        ],
      ),
    );
  }
}

class SettingsVisibilityBotton extends StatelessWidget {
  const SettingsVisibilityBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Visibility",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: open
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    weight: 100,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    weight: 100,
                  ),
          ),
        ],
      ),
    );
  }
}

class SettingsNotificationsBotton extends StatelessWidget {
  const SettingsNotificationsBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: open
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    weight: 100,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    weight: 100,
                  ),
          ),
        ],
      ),
    );
  }
}
