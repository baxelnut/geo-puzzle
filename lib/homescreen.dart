// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:geopuzzle/about_us.dart';
import 'package:geopuzzle/settings.dart';
import 'package:geopuzzle/tutorial.dart';
import 'package:geopuzzle/play.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

TextStyle _lightFontHead = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);

TextStyle _darkFontHead = const TextStyle(
    color: Colors.white,
    // foreground: Paint()
    //   ..shader = ui.Gradient.linear(
    //     const Offset(0, 20),
    //     const Offset(150, 20),
    //     <Color>[
    //       Colors.indigoAccent,
    //       Colors.white,
    //     ],
    //   ),
    fontWeight: FontWeight.bold,
    fontSize: 24);

TextStyle _darkFontBody = const TextStyle(
    color: Colors.white,
    // foreground: Paint()
    //   ..shader = ui.Gradient.linear(
    //     const Offset(0, 20),
    //     const Offset(150, 20),
    //     <Color>[
    //       Colors.indigoAccent,
    //       Colors.white,
    //     ],
    //   ),
    fontSize: 14);
TextStyle _lightFontBody = const TextStyle(color: Colors.white, fontSize: 14);

TextStyle _darkFontOption = const TextStyle(
    color: Colors.white,
    // foreground: Paint()
    //   ..shader = ui.Gradient.linear(
    //     const Offset(0, 20),
    //     const Offset(150, 20),
    //     <Color>[
    //       Colors.indigoAccent,
    //       Colors.white,
    //     ],
    //   ),
    fontSize: 20);
TextStyle _lightFontOption = const TextStyle(color: Colors.white, fontSize: 20);

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool statusSwitch = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness: Brightness.dark,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(21, 255, 255, 255)))),
      home: Scaffold(
          backgroundColor: const Color.fromARGB(141, 30, 39, 66),
          body: Container(
            decoration: statusSwitchMode ? _darkBackground : _lightBackground,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    //LOGO
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/logo_geo_p.png",
                          width: 32,
                          height: 45,
                        ),
                        title: Text("Geo Puzzle",
                            style: statusSwitchMode
                                ? _lightFontHead
                                : _darkFontHead),
                      ),
                    ),

                    Container(
                      height: 50,
                    ),
                    SizedBox.fromSize(
                        size: const Size.fromHeight(115),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          child: Text(
                            "TUTORIAL",
                            style: statusSwitchMode
                                ? _lightFontOption
                                : _darkFontOption,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const learnPage()));
                          },
                        )),
                    Container(
                      height: 20,
                    ),
                    SizedBox.fromSize(
                        size: const Size.fromHeight(115),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          child: Text(
                            "PLAY ALONE",
                            style: statusSwitchMode
                                ? _lightFontOption
                                : _darkFontOption,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Play(),
                                ));
                          },
                        )),
                    Container(
                      height: 20,
                    ),
                    SizedBox.fromSize(
                        size: const Size.fromHeight(115),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          child: Text(
                            "PLAY WITH FRIENDS",
                            style: statusSwitchMode
                                ? _lightFontOption
                                : _darkFontOption,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => leadDialog);
                          },
                        )),
                    Container(
                      height: 20,
                    ),
                    SizedBox.fromSize(
                        size: const Size.fromHeight(115),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          child: Text(
                            "SETTINGS",
                            style: statusSwitchMode
                                ? _lightFontOption
                                : _darkFontOption,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const Settingz();
                                });
                          },
                        )),
                    Container(
                      height: 20,
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(115),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const About_Us();
                              });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: Text(
                          "ABOUT US",
                          style: statusSwitchMode
                              ? _lightFontOption
                              : _darkFontOption,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                    ),
                    Text(
                      "version 1.0.1",
                      style: statusSwitchMode ? _lightFontBody : _darkFontBody,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Dialog leadDialog = Dialog(
  child: Container(
    height: 100,
    width: 250,
    color: Colors.blueGrey,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 35),
          child: Text(
            "Coming soon!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  ),
);
