// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:geopuzzle/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Settingz(),
    );
  }
}

class Settingz extends StatefulWidget {
  const Settingz({super.key});

  @override
  State<Settingz> createState() => _SettingzState();
}

// ThemeData _lightTheme = ThemeData(
//   primarySwatch: Colors.blueGrey,
//   brightness: Brightness.light,
//   fontFamily: GoogleFonts.montserrat().fontFamily,
// );

// ThemeData _darkTheme = ThemeData(
//   primarySwatch: Colors.red,
//   brightness: Brightness.dark,
//   fontFamily: GoogleFonts.montserrat().fontFamily,
// );

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.cover));

Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

// BoxDecoration _colorfulBackground = const BoxDecoration(
//     image: DecorationImage(
//         image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fitHeight));

// BoxDecoration _extracolorfulBackground = const BoxDecoration(
//     image: DecorationImage(
//         image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));

// BoxDecoration _defaultBackground = const BoxDecoration(
//     image: DecorationImage(
//         image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));

// ColorFiltered _mode = ColorFiltered(
//   colorFilter: ColorFilter.mode(Colors.green, BlendMode.color),
//   child: Image.asset("assets/images/bg.png"),
// );

class _SettingzState extends State<Settingz> {
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;

  // late AudioPlayer audioPlayer;
  // String duration = "00:00:00";

  // _AudioPlayerState() {
  //   audioPlayer = AudioPlayer();
  //   audioPlayer.onDurationChanged.listen((duration) {
  //     setState(() {
  //       duration = duration.toString() as Duration;
  //     });
  //   });
  //   audioPlayer.setReleaseMode(ReleaseMode.loop);
  // }

  // void playSound(url) async {
  //   await audioPlayer.play(url);
  // }

  // void pauseSound(String url) async {
  //   await audioPlayer.stop();
  // }

  // void resumeSound(String url) async {
  //   await audioPlayer.resume();
  // }

  // final double = VolumeControl.setVolume(1);

  // @override
  // void initState() {
  //   super.initState();

  //   setAudio();

  //   AudioPlayer().onPlayerStateChanged.listen((state) {
  //     setState(() {
  //       isPlaying = state == PlayerState.paused;
  //     });
  //   });
  // }

  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  // late AudioPlayer _audioPlayer;
  // @override
  // void initState() {
  //   super.initState();
  //   _audioPlayer = AudioPlayer()
  //     ..setSourceAsset("assets/audio/bgaudio_well_now.mp3");
  // }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

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
      // statusSwitchMode ? _darkTheme : _lightTheme,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
        ),
        body: Container(
          decoration: statusSwitchMode ? _darkBackground : _lightBackground,
          child: Scaffold(
              backgroundColor: const Color.fromARGB(141, 30, 39, 66),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 69),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Switch(
                              value: statusSwitchMode,
                              onChanged: (bool isOn) {
                                setState(() {
                                  statusSwitchMode = isOn;
                                });
                              }),
                          title: const Text(
                            "Dark Mode",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        if (statusSwitchMode == true)
                          const Text(
                            "ON",
                            style: TextStyle(color: Colors.white),
                          )
                        else
                          const Text(
                            "OFF",
                            style: TextStyle(color: Colors.white),
                          ),
                        Container(
                          height: 69,
                        ),
                        // ListTile(
                        //   leading: Switch(
                        //       value: statusSwitchModeColorful,
                        //       onChanged: (bool isOn) {
                        //         setState(() {
                        //           statusSwitchModeColorful = isOn;
                        //         });
                        //       }),
                        //   title: const Text(
                        //     "Colorful Mode",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                        // if (statusSwitchModeColorful == false)
                        //   const Text(
                        //     "OFF",
                        //     style: TextStyle(color: Colors.white),
                        //   )
                        // else
                        //   const Text(
                        //     "ON",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // Container(
                        //   height: 69,
                        // ),
                        // ListTile(
                        //   leading: Switch(
                        //       value: statusSwitchModeExtraColorful,
                        //       onChanged: (bool isOn) {
                        //         setState(() {
                        //           statusSwitchModeExtraColorful = isOn;
                        //         });
                        //       }),
                        //   title: const Text(
                        //     "Extra Colorful Mode",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                        // if (statusSwitchModeExtraColorful == false)
                        //   const Text(
                        //     "OFF",
                        //     style: TextStyle(color: Colors.white),
                        //   )
                        // else
                        //   const Text(
                        //     "ON",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // Container(
                        //   height: 69,
                        // ),

                        ListTile(
                          leading: Switch(
                              value: statusSwitchSound,
                              onChanged: (bool isOn) {
                                if (statusSwitchSound == false) {
                                  DJ = true;
                                } else if (statusSwitchSound == true) {
                                  DJ = false;
                                }

                                // var assetsAudioPLayer = AssetsAudioPlayer();
                                // final Future<void> playRN =
                                //     assetsAudioPLayer.open(Audio.file(
                                //         "assets/audio/bgaudio_well_now.mp3"));
                                // assetsAudioPLayer.setLoopMode(LoopMode.playlist);

                                // if (DJ = false) {
                                //   var audioPlayer = AudioPlayer();
                                //   audioPlayer.setReleaseMode(ReleaseMode.loop);
                                //   void playSound(url) async {
                                //     await audioPlayer.play(
                                //         "assets/audio/bgaudio_well_now.mp3"
                                //             as Source);
                                //   }
                                // } else {
                                //   var audioPlayer = AudioPlayer();
                                //   audioPlayer.setReleaseMode(ReleaseMode.stop);
                                //   DJ = false;
                                // }

                                setState(() {
                                  if (DJ == true) {
                                    statusSwitchSound = isOn;
                                    Future<void> musiks =
                                        AssetsAudioPlayer.newPlayer().open(
                                      Audio(
                                          "assets/audio/bgaudio_well_now.mp3"),
                                      // loopMode: LoopMode.single
                                    );
                                  } else if (DJ == false) {
                                    Future<void> musiks =
                                        AssetsAudioPlayer().stop();
                                  }
                                });
                              }),
                          title: const Text(
                            "Sound",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        if (statusSwitchSound == false)
                          const Text(
                            "OFF",
                            style: TextStyle(color: Colors.white),
                          )
                        else
                          const Text(
                            "ON",
                            style: TextStyle(color: Colors.white),
                          ),

                        // Container(
                        //   height: 69,
                        // ),
                        // SizedBox.fromSize(
                        //   size: const Size.fromHeight(50),
                        //   child: ElevatedButton(
                        //       style: ButtonStyle(
                        //           backgroundColor:
                        //               MaterialStateProperty.resolveWith(
                        //                   (states) => Colors.white),
                        //           shape: MaterialStateProperty.all<
                        //                   RoundedRectangleBorder>(
                        //               RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(25)))),
                        //       onPressed: () {
                        //         // Navigator.push(
                        //         //     context,
                        //         //     MaterialPageRoute(
                        //         //       builder: (context) =>
                        //         //           const SettingsColorful(),
                        //         //     ));
                        //         // if (statusSwitchMode == true) {
                        //         //   _defaultBackground = _darkBackground;
                        //         //   _darkBackground = _colorfulBackground;
                        //         // } else {
                        //         //   _defaultBackground = _lightBackground;
                        //         //   _lightBackground = _colorfulBackground;
                        //         // }
                        //       },
                        //       child: GradientText(
                        //         "Colorful Mode",
                        //         style: const TextStyle(
                        //             fontSize: 17.8, fontWeight: FontWeight.bold),
                        //         colors: const [
                        // Colors.red,
                        // Colors.orange,
                        // Colors.green,
                        // Colors.teal,
                        // Colors.blue,
                        // Colors.blueAccent,
                        // Colors.purple,
                        // Colors.deepPurple,
                        //         ],
                        //       )),
                        // ),
                        Container(
                          height: 69,
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       // AssetsAudioPlayer.newPlayer().open(
                        //       //   Audio("assets/audio/bgaudio_well_now.wav"),
                        //       //   autoStart: true,
                        //       //   showNotification: true,
                        //       // );
                        //       // final player = AudioCache();
                        //       // player.play("assets/audio/bgaudio_well_now.mp3");
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => SoundTesterz()));
                        //     },
                        //     child: Container(
                        //       color: Colors.amber,
                        //     )),
                        SizedBox.fromSize(
                          size: const Size.fromHeight(50),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              onPressed: () {
                                // setState(() {
                                //   if (statusSwitch = true) {
                                //     _defaultBackground = _darkBackground;
                                //   } else {
                                //     _defaultBackground = _lightBackground;
                                //   }
                                // });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ));
                              },
                              child: const Text(
                                "Apply",
                                style: TextStyle(fontSize: 17.8),
                              )),
                        )
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     if (isPlaying) {
                        //       await AudioPlayer().pause();
                        //     } else {
                        //       String url =
                        //           "https://www.youtube.com/watch?v=fjUGC8g4GOE";
                        //       AudioPlayer().play(UrlSource(url));
                        //     }
                        //   },
                        // child: Container(
                        //   height: 100,
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  // Future setAudio() async {
  //   AudioPlayer().setReleaseMode(ReleaseMode.loop);

  //   final player = AudioCache(prefix: "assets/");
  //   final url = await player.load("bgaudio_well_now.mp3");
  //   AudioPlayer().setSourceUrl(url.path);
  // }
}
