// ignore_for_file: unused_local_variable, unused_import, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geopuzzle/auth.dart';
import 'package:geopuzzle/homescreen.dart';
import 'package:geopuzzle/levels/canvas1.dart';
// import 'package:geopuzzle/levels/kartesius.dart';
// import 'package:geopuzzle/levels/kartesius2.dart';
// import 'package:geopuzzle/levels/kartesius3.dart';
import 'package:geopuzzle/levels/kartesius4.dart';
import 'package:geopuzzle/levels/level1.dart';
import 'package:geopuzzle/levels/level2.dart';
import 'package:geopuzzle/levels/level3.dart';
import 'package:geopuzzle/levels/level4.dart';
import 'package:geopuzzle/login.dart';
import 'package:geopuzzle/providers/players.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';

import 'levels/kartesius5.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: ChangeNotifierProvider(
        create: (context) => Players(),
        child: ChangeNotifierProvider(
          create: (context) => AuthService(),
          child: const LevelCategory(),
        ),
      ),
    );
  }
}

Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

class LevelCategory extends StatefulWidget {
  const LevelCategory({super.key});

  @override
  State<LevelCategory> createState() => _LevelCategoryState();
}

class _LevelCategoryState extends State<LevelCategory> {
  // List<String> finishnotfinish = [
  //  "082111633027",
  //  "082111633037",
  //  "082111633068",
  // ];
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final playerId = AuthService().getId(user);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(21, 255, 255, 255)))),
        home: Scaffold(
            backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
            appBar: AppBar(
              leading: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              title: const Text("Play Alone"),
              backgroundColor: const Color.fromARGB(37, 255, 255, 255),
            ),
            endDrawer: Drawer(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    height: 150,
                    padding: const EdgeInsets.all(40),
                    color: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
                    child: const Text(
                      "S E T T I N G S",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  ListTile(
                    leading: Switch(
                        value: statusSwitchMode,
                        onChanged: (bool isOn) {
                          setState(() {
                            statusSwitchMode = isOn;
                          });
                        }),
                    title: const Text("Dark Mode"),
                  ),

                  if (statusSwitchMode == true)
                    const Text("ON")
                  else
                    const Text("OFF"),

                  // FLUTTER 25 (SWITCH)
                  ListTile(
                    leading: Switch(
                        value: statusSwitchSound,
                        onChanged: (bool isOn) {
                          if (statusSwitchSound == false) {
                            Future<void> musiks =
                                AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/audio/bgaudio_well_now.mp3"),
                            );

                            var assetsAudioPlayer = AssetsAudioPlayer();
                            assetsAudioPlayer.play();
                            assetsAudioPlayer.setLoopMode(LoopMode.single);
                          } else if (statusSwitchSound == true) {
                            AssetsAudioPlayer.newPlayer().stop();
                          }

                          setState(() {
                            statusSwitchSound = isOn;
                          });
                        }),
                    title: const Text("Sound"),
                  ),

                  if (statusSwitchSound == false)
                    const Text("OFF")
                  else
                    const Text("ON"),
                  Container(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey,
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: statusSwitchMode ? _darkBackground : _lightBackground,
              child: GridView.count(
                padding: const EdgeInsets.all(15),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  //sementara masih manual dan belum make index !!!!!!
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Level 1",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Kartesius(),
                  //             ));
                  //       },
                  //     )),
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Level 2",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Kartesius2(),
                  //             ));
                  //       },
                  //     )),
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Level 3",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Kartesius3(),
                  //             ));
                  //       },
                  //     )),
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Demo 1",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Kartesius4(),
                  //             ));
                  //       },
                  //     )),
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Demo 2",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Kartesius5(),
                  //             ));
                  //       },
                  //     )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 1",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Level1(),
                              ));
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 2",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          if (playerId != "") {
                            final level = await Players().getlevel(playerId);
                            if (level >= 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Level2(),
                                  ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          } else {
                            String? deviceId =
                                await PlatformDeviceId.getDeviceId;
                            String finalDeviceId = deviceId ?? "";
                            Future data = Players().checkData(finalDeviceId);
                            if (await data == true) {
                              print('cuki');
                              final level =
                                  await Players().getlevel(finalDeviceId);
                              if (level >= 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Level2(),
                                    ));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        leadDialog);
                              }
                            } else {
                              Players().uhuyno(finalDeviceId, 0);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          }
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 3",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          if (playerId != "") {
                            final level = await Players().getlevel(playerId);
                            if (level >= 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Level3(),
                                  ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          } else {
                            String? deviceId =
                                await PlatformDeviceId.getDeviceId;
                            String finalDeviceId = deviceId ?? "";
                            Future data = Players().checkData(finalDeviceId);
                            if (await data == true) {
                              print('cuki');
                              final level =
                                  await Players().getlevel(finalDeviceId);
                              if (level >= 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Level3(),
                                    ));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        leadDialog);
                              }
                            } else {
                              Players().uhuyno(finalDeviceId, 0);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          }
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 4",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          if (playerId != "") {
                            final level = await Players().getlevel(playerId);
                            if (level >= 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Level4(),
                                  ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          } else {
                            String? deviceId =
                                await PlatformDeviceId.getDeviceId;
                            String finalDeviceId = deviceId ?? "";
                            Future data = Players().checkData(finalDeviceId);
                            if (await data == true) {
                              print('cuki');
                              final level =
                                  await Players().getlevel(finalDeviceId);
                              if (level >= 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Level2(),
                                    ));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        leadDialog);
                              }
                            } else {
                              Players().uhuyno(finalDeviceId, 0);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      leadDialog);
                            }
                          }
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 5",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 6",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 7",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 8",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 9",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 10",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  SizedBox.fromSize(
                      size: const Size.fromHeight(150),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        child: const Text(
                          "Level 11",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => leadDialog);
                        },
                      )),
                  // SizedBox.fromSize(
                  //     size: const Size.fromHeight(150),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(25)))),
                  //       child: const Text(
                  //         "Canvas",
                  //         style: TextStyle(
                  //             fontSize: 25,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) =>
                  //                   CartesianCoordinateCanvas(),
                  //             ));
                  //       },
                  //     )),

                  // const LevelBox(), const LevelBox(), const LevelBox(),
                  // const LevelBox(), const LevelBox(),
                  // const LevelBox(), const LevelBox(), const LevelBox(),
                  // const LevelBox(), const LevelBox(),
                ],
              ),
            )));
  }
}

class LevelBox extends StatelessWidget {
  const LevelBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context, builder: (BuildContext context) => leadDialog);
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: const Text(
          "NOT FINISHED",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Dialog leadDialog = Dialog(
  child: Container(
    height: 100,
    width: 250,
    color: Colors.grey,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: Text(
            "Finish your previous level first!",
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
