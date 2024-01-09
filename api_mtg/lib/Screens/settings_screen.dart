// ignore: file_names
import 'package:flutter/material.dart';

enum SettingsMenus {
  none,
  editProfile,
  accountManagment,
  visibility,
  notifications,
  language,
  help,
}

Map<String, dynamic> opciones = {
  "name": "Name",
  "username": "Username",
  "private": false,
  "darkMode": true,
};

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    super.key,
    required this.settings,
  });

  Map<String, dynamic> settings;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsMenus openedOption = SettingsMenus.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (widget.settings["darkMode"])
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Cuadro negro superior
            Container(
              color:
                  (widget.settings["darkMode"]) ? Colors.black : Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Flecha hacia atras
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () => {Navigator.of(context).pop()},
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        size: 34,
                      ),
                    ),
                  ),
                  const Spacer(),
                  //Nombre settings
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: (widget.settings["darkMode"])
                              ? Colors.white54
                              : Colors.black54,
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
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: (widget.settings["darkMode"])
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),
                  //Botones varios
                  SettingsEditProfileBotton(
                    open: openedOption == SettingsMenus.editProfile,
                    settings: widget.settings,
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
                    settings: widget.settings,
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
                    settings: widget.settings,
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

                  //Languaje grey text
                  Text(
                    "Languaje",
                    style: TextStyle(
                      fontSize: 20,
                      color: (widget.settings["darkMode"])
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),

                  LanguageBotton(
                   open: openedOption == SettingsMenus.language,
                   settings: widget.settings,
                    onPressed: () {
                      setState(() {
                        openedOption =
                            openedOption == SettingsMenus.language
                                ? SettingsMenus.none
                                : SettingsMenus.language;
                      });
                    },
                  ),
                  //Help grey text
                  Text(
                    "Help",
                    style: TextStyle(
                      fontSize: 20,
                      color: (widget.settings["darkMode"])
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),

                  HelpBotton(
                    open: openedOption == SettingsMenus.help,
                    settings: widget.settings,
                    onPressed: () {
                      setState(() {
                        openedOption =
                            openedOption == SettingsMenus.help
                                ? SettingsMenus.none
                                : SettingsMenus.help;
                      });
                    },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingsEditProfileBotton extends StatefulWidget {
  SettingsEditProfileBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  State<SettingsEditProfileBotton> createState() =>
      _SettingsEditProfileBottonState();
}

class _SettingsEditProfileBottonState extends State<SettingsEditProfileBotton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                color:
                    (widget.settings["darkMode"]) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (opciones["darkMode"]) ? "Edit Profile" : "Testeo",
                  style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: widget.onPressed,
                icon: widget.open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        widget.open
            ? Text(
                "Profile Info",
                style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontSize: 26,
                    fontStyle: FontStyle.italic),
              )
            : Container(),
        //Name
        widget.open
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Name:",
                      style: TextStyle(
                          color: (widget.settings["darkMode"])
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      flex: 60,
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          style: TextStyle(
                              color: (widget.settings["darkMode"])
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 36,
                          onSubmitted: (text) {
                            //El name de settings se vuelve lo que pongamos
                            widget.settings["name"] = text;
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 40,
                  ),
                ],
              )
            : Container(), //Name
        widget.open
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Username:",
                      style: TextStyle(
                          color: (widget.settings["darkMode"])
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      flex: 60,
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          style: TextStyle(
                              color: (widget.settings["darkMode"])
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 25,
                          onSubmitted: (text) {
                            //El username de settings se vuelve lo que pongamos;
                            widget.settings["username"] = text;
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 40,
                  ),
                ],
              )
            : Container(), //usernane
      ],
    );
  }
}

// ignore: must_be_immutable
class SettingsAccountManagmentBotton extends StatelessWidget {
  SettingsAccountManagmentBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SettingsVisibilityBotton extends StatefulWidget {
  SettingsVisibilityBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  State<SettingsVisibilityBotton> createState() =>
      _SettingsVisibilityBottonState();
}

class _SettingsVisibilityBottonState extends State<SettingsVisibilityBotton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color:
                    (widget.settings["darkMode"]) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Visibility",
                  style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: widget.onPressed,
                icon: widget.open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        //Texto only open
        widget.open
            ? Text(
                "Visibility Options",
                style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontSize: 21,
                    fontStyle: FontStyle.italic),
              )
            : Container(),
        widget.open
            ? Checkbox(
                value: widget.settings["darkMode"],
                onChanged: (value) => {
                  setState(
                    () {
                      bool change = value!;
                      value = (change) ? true : false;
                      widget.settings["darkMode"] = value!;
                      opciones["darkMode"] = value!;
                    },
                  )
                },
              )
            : Container(),
      ],
    );
  }
}

class SettingsNotificationsBotton extends StatefulWidget {
  const SettingsNotificationsBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  State<SettingsNotificationsBotton> createState() =>
      _SettingsNotificationsBottonState();
}

class _SettingsNotificationsBottonState
    extends State<SettingsNotificationsBotton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                onPressed: widget.onPressed,
                icon: widget.open
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
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class LanguageBotton extends StatefulWidget {
  LanguageBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  State<LanguageBotton> createState() =>
      _LanguageBottonState();
}

class _LanguageBottonState extends State<LanguageBotton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color:
                    (widget.settings["darkMode"]) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Language",
                  style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: widget.onPressed,
                icon: widget.open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: (widget.settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        //Texto only open
        widget.open
            ? Text(
                "English:",
                style: TextStyle(
                    color: (widget.settings["darkMode"])
                        ? Colors.white
                        : Colors.black,
                    fontSize: 21,
                    fontStyle: FontStyle.italic),
              )
            : Container(),
        widget.open
            ? Checkbox(
                value: widget.settings["darkMode"],
                onChanged: (value) => {
                  setState(
                    () {
                      bool change = value!;
                      value = (change) ? true : false;
                      widget.settings["darkMode"] = value!;
                      opciones["darkMode"] = value!;
                    },
                  )
                },
              )
            : Container(),
      ],
    );
  }
}

// ignore: must_be_immutable
class HelpBotton extends StatelessWidget {
  HelpBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Texto base que siempre aparece
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined, //Icono base
                color: (settings["darkMode"]) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Edit Profile", //Nombre del boton
                  style: TextStyle(
                    color: (settings["darkMode"]) ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              //Flechita abierto cerrado
              IconButton(
                onPressed: onPressed,
                icon: open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: (settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: (settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        open
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Username:",
                      style: TextStyle(
                          color: (settings["darkMode"])
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ],
              )
            : Container(), //usernane
      ],
    );
  }
}

// ignore: must_be_immutable
class SettingsPlantillaBotton extends StatelessWidget {
  SettingsPlantillaBotton({
    super.key,
    required this.open,
    required this.onPressed,
    required this.settings,
  });

  final bool open;
  final void Function() onPressed;
  Map<String, dynamic> settings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Texto base que siempre aparece
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined, //Icono base
                color: (settings["darkMode"]) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Edit Profile", //Nombre del boton
                  style: TextStyle(
                    color: (settings["darkMode"]) ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              //Flechita abierto cerrado
              IconButton(
                onPressed: onPressed,
                icon: open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: (settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: (settings["darkMode"])
                            ? Colors.white
                            : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        //Resto de elementos que solo se han de mostrar si Open = true
        open
            ? Text(
                "Profile Info",
                style: TextStyle(
                    color: (settings["darkMode"]) ? Colors.white : Colors.black,
                    fontSize: 26,
                    fontStyle: FontStyle.italic),
              )
            : Container(),
        //Name
        open
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Name:",
                      style: TextStyle(
                          color: (settings["darkMode"])
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      flex: 60,
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          style: TextStyle(
                              color: (settings["darkMode"])
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 36,
                          onSubmitted: (text) {
                            //El name de settings se vuelve lo que pongamos
                            settings["name"] = text;
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 40,
                  ),
                ],
              )
            : Container(), //Name
        open
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Username:",
                      style: TextStyle(
                          color: (settings["darkMode"])
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      flex: 60,
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          style: TextStyle(
                              color: (settings["darkMode"])
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 25,
                          onSubmitted: (text) {
                            //El username de settings se vuelve lo que pongamos;
                            settings["username"] = text;
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 40,
                  ),
                ],
              )
            : Container(), //usernane
      ],
    );
  }
}
