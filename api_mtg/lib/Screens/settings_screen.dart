// ignore: file_names
import 'package:api_mtg/Model/providerThing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SettingsMenus {
  none,
  editProfile,
  accountManagment,
  visibility,
  notifications,
  language,
  help,
}

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsMenus openedOption = SettingsMenus.none;

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Cuadro negro superior
            Container(
              color: (globalInfo.darkMode) ? Colors.black : Colors.white,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        (globalInfo.language == Idioma.spanish)
                            ? "Ajustes"
                            : (globalInfo.language == Idioma.catalan)
                                ? "Configuracio"
                                : "Settings",
                        style: TextStyle(
                          color: (globalInfo.darkMode)
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
                    (globalInfo.language == Idioma.spanish)
                        ? "Perfil"
                        : (globalInfo.language == Idioma.catalan)
                            ? "Perfil"
                            : "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: (globalInfo.darkMode)
                          ? Colors.white54
                          : Colors.black54,
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

                  // SettingsNotificationsBotton(
                  //   open: openedOption == SettingsMenus.notifications,
                  //   onPressed: () {
                  //     setState(() {
                  //       openedOption =
                  //           openedOption == SettingsMenus.notifications
                  //               ? SettingsMenus.none
                  //               : SettingsMenus.notifications;
                  //     });
                  //   },
                  // ),

                  //Languaje grey text
                  Text(
                    (globalInfo.language == Idioma.spanish)
                        ? "Idioma"
                        : (globalInfo.language == Idioma.catalan)
                            ? "Llengua"
                            : "Language",
                    style: TextStyle(
                      fontSize: 20,
                      color: (globalInfo.darkMode)
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),

                  LanguageBotton(
                    open: openedOption == SettingsMenus.language,
                    onPressed: () {
                      setState(() {
                        openedOption = openedOption == SettingsMenus.language
                            ? SettingsMenus.none
                            : SettingsMenus.language;
                      });
                    },
                  ),
                  //Help grey text
                  Text(
                    (globalInfo.language == Idioma.spanish)
                        ? "Ayuda"
                        : (globalInfo.language == Idioma.catalan)
                            ? "Ajuda"
                            : "Help",
                    style: TextStyle(
                      fontSize: 20,
                      color: (globalInfo.darkMode)
                          ? Colors.white54
                          : Colors.black54,
                    ),
                  ),

                  HelpBotton(
                    open: openedOption == SettingsMenus.help,
                    onPressed: () {
                      setState(() {
                        openedOption = openedOption == SettingsMenus.help
                            ? SettingsMenus.none
                            : SettingsMenus.help;
                      });
                    },
                  )
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
  const SettingsEditProfileBotton({
    super.key,
    required this.open,
    required this.onPressed,
  });

  final bool open;
  final void Function() onPressed;

  @override
  State<SettingsEditProfileBotton> createState() =>
      _SettingsEditProfileBottonState();
}

class _SettingsEditProfileBottonState extends State<SettingsEditProfileBotton> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (globalInfo.language == Idioma.spanish)
                      ? "Editar Perfil"
                      : (globalInfo.language == Idioma.catalan)
                          ? "Editar Perfil"
                          : "Edit Profile",
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        widget.open
            ? Text(
                (globalInfo.language == Idioma.spanish)
                    ? "Info. perfil"
                    : (globalInfo.language == Idioma.catalan)
                        ? "Info. perfil"
                        : "Profile Info.",
                style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                      (globalInfo.language == Idioma.spanish)
                          ? "Nombre:"
                          : (globalInfo.language == Idioma.catalan)
                              ? "Nom:"
                              : "Your Name:",
                      style: TextStyle(
                          color: (globalInfo.darkMode)
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
                              color: (globalInfo.darkMode)
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 36,
                          onSubmitted: (text) {
                            //El name de settings se vuelve lo que pongamos
                            globalInfo.setName(text);
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
                          color: (globalInfo.darkMode)
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
                              color: (globalInfo.darkMode)
                                  ? Colors.white70
                                  : Colors.black87,
                              fontSize: 14),
                          maxLength: 25,
                          onSubmitted: (text) {
                            //El username de settings se vuelve lo que pongamos;
                            globalInfo.setUserName(text);
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
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.manage_accounts_outlined,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Account Managment",
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: open
                    ? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
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
  });

  final bool open;
  final void Function() onPressed;

  @override
  State<SettingsVisibilityBotton> createState() =>
      _SettingsVisibilityBottonState();
}

class _SettingsVisibilityBottonState extends State<SettingsVisibilityBotton> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (globalInfo.language == Idioma.spanish)
                      ? "Visibilidad"
                      : (globalInfo.language == Idioma.catalan)
                          ? "Visibilitat"
                          : "Visibility",
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        //Texto only open
        widget.open
            ? Row(
                children: [
                  Text(
                    ((globalInfo.darkMode) ? "Dark Mode" : "Brigth Mode"),
                    style: TextStyle(
                      color:
                          (globalInfo.darkMode) ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => {
                      setState(
                        () {
                          bool change = (globalInfo.darkMode) ? false : true;
                          globalInfo.setDarkMode(change);
                        },
                      )
                    },
                    icon: globalInfo.darkMode
                        ? Icon(
                            Icons.sunny,
                            color: (globalInfo.darkMode)
                                ? Colors.white
                                : Colors.black,
                            weight: 100,
                          )
                        : Icon(
                            Icons.nightlight,
                            color: (globalInfo.darkMode)
                                ? Colors.white
                                : Colors.black,
                            weight: 100,
                          ),
                  )
                ],
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
    final globalInfo = context.watch<GlobalInfo>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.notifications_none,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
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
  });

  final bool open;
  final void Function() onPressed;

  @override
  State<LanguageBotton> createState() => _LanguageBottonState();
}

class _LanguageBottonState extends State<LanguageBotton> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.abc_outlined,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (globalInfo.language == Idioma.spanish)
                      ? "Idiomas"
                      : (globalInfo.language == Idioma.catalan)
                          ? "Llenguas"
                          : "Languagues",
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        //Texto only open
        widget.open
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => {
                      setState(
                        () {
                          globalInfo.setLanguage(Idioma.spanish);
                        },
                      )
                    },
                    child: Text(
                      "Español",
                      style: TextStyle(
                          color: (globalInfo.language == Idioma.spanish)
                              ? Colors.blue
                              : (globalInfo.darkMode)
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 21,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      setState(
                        () {
                          globalInfo.setLanguage(Idioma.catalan);
                        },
                      )
                    },
                    child: Text(
                      "Catala",
                      style: TextStyle(
                          color: (globalInfo.language == Idioma.catalan)
                              ? Colors.blue
                              : (globalInfo.darkMode)
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 21,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      setState(
                        () {
                          globalInfo.setLanguage(Idioma.english);
                        },
                      )
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: (globalInfo.language == Idioma.english)
                              ? Colors.blue
                              : (globalInfo.darkMode)
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 21,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
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
  });

  final bool open;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Column(
      children: [
        //Texto base que siempre aparece
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined, //Icono base
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (globalInfo.language == Idioma.spanish)
                      ? "Preguntas y Soporte"
                      : (globalInfo.language == Idioma.catalan)
                          ? "Preguntes i Suport"
                          : "FAQ and Support", //Nombre del boton
                  style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
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
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      )
                    : Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (globalInfo.darkMode) ? Colors.white : Colors.black,
                        weight: 100,
                      ),
              ),
            ],
          ),
        ),
        open
            ? Text(
                "Muuuuuucho texto:",
                style: TextStyle(
                    color: (globalInfo.darkMode) ? Colors.white : Colors.black,
                    fontSize: 20),
              )
            : Container(), //usernane
      ],
    );
  }
}
