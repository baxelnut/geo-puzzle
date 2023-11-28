// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geopuzzle/my_button.dart';
import 'package:geopuzzle/play.dart';
import 'package:geopuzzle/result_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:geopuzzle/variables.dart';

import '../auth.dart';
import '../providers/players.dart';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _Level2State();
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

TextStyle _darkBGFont = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  color: Colors.white,
);

TextStyle _lightBGFont = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  color: Colors.black,
);

class _Level2State extends State<Level2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: ChangeNotifierProvider(
        create: (context) => Players(),
        child: const Stage0(),
      ),
    );
  }
}

class Stage0 extends StatefulWidget {
  const Stage0({super.key});

  @override
  State<Stage0> createState() => _Stage0State();
}

class Input {
  Input(this.sbY, this.sbX);
  final int sbY;
  final int sbX;
}

class _Stage0State extends State<Stage0> {
  // number pad list
  List<String> numberPad = [
    '1',
    '2',
    '3',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '7',
    '8',
    '9',
    '=',
    '',
    '0',
    '',
    '-'
  ];

  // number A, number B
  int numberA = 1;
  int numberB = 1;

  // user answer
  String userAnswer = '';
  // nilai x^2
  String userAnswer2 = '0';
  // nilai x
  String userAnswerX = '0';
  // nilai c
  String userAnswerC = '0';

  int get jawabanX => int.parse(userAnswerX);
  int get jawabanC => int.parse(userAnswerC);
  final user = FirebaseAuth.instance.currentUser;

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        // calculate if user is correct or incorrect
        checkResult();
      } else if (button == 'C') {
        // clear the input
        userAnswer = '';
      } else if (button == 'DEL') {
        // delete the last number
        if (int.parse(userAnswer) > 0) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        } else if (int.parse(userAnswer) <= 0) {
          userAnswer = '';
        }
      } else if (userAnswer.length <= 4) {
        // maximum of 4 numbers can be inputted
        userAnswer += button;
      } else if (button == '-') {
        userAnswer = '-1';
      }
    });
  }

  // check if user is correct or not
  void checkResult() {
    if (int.parse(userAnswerX) == 0 && int.parse(userAnswerC) != 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Nice!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
      benar();
    } else {
      salah();
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: () {},
              // goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  void goToNextQuestion() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const Play()));
    final players = Provider.of<Players>(context, listen: false);
    final playerId = AuthService().getId(user);
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    if (playerId != "") {
      final level = await Players().getlevel(playerId);
      if (level <= 1) {
        players.levelup(AuthService().getId(user), 2);
      } else {
        //raono
      }
    } else {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      String finalDeviceId = deviceId ?? "";
      print(finalDeviceId);

      await Players().uhuyno(finalDeviceId, 2);
    }
  }

  // String y1 = "A";
  Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
  Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
            appBar: AppBar(
              leading: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Play()));
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              title: const Text("Level 2"),
              backgroundColor: const Color.fromARGB(37, 255, 255, 255),
            ),
            body: Container(
              decoration: statusSwitchMode ? _darkBackground : _lightBackground,
              child: Column(
                children: [
                  Stack(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: SfCartesianChart(
                              enableAxisAnimation: true,
                              primaryXAxis: NumericAxis(
                                crossesAt: 0,
                              ),
                              primaryYAxis: NumericAxis(
                                crossesAt: 0,
                              ),
                              enableSideBySideSeriesPlacement: true,
                              borderWidth: 1,
                              // Initialize category axis
                              series: <LineSeries<Input, int>>[
                                LineSeries<Input, int>(
                                    dataSource: <Input>[
                                      Input(0, jawabanC),
                                      Input(jawabanX + 10,
                                          jawabanX * jawabanX + jawabanC),
                                    ],
                                    xValueMapper: (Input sbX, _) => sbX.sbY,
                                    yValueMapper: (Input sbX, _) => sbX.sbX)
                              ]),
                        ),
                      ),
                    ),
                    // Positioned(
                    //     top: 250,
                    //     bottom: 60,
                    //     left: 75,
                    //     right: 200,
                    //     child: Container(
                    //       color: Colors.amber,
                    //     ))
                  ]),
                  // question
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // question y=ax+c
                          Text('y = $jawabanX x + $jawabanC',
                              style: statusSwitchMode
                                  ? _darkBGFont
                                  : _lightBGFont),
                          Text("Make a horizontal line! (where y isn't 0)",
                              style: statusSwitchMode
                                  ? const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                    )
                                  : const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black,
                                    )),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        width: 10,
                      ),
                      // number pad
                      SizedBox(
                        height: 240,
                        width: 240,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: GridView.builder(
                            itemCount: numberPad.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (context, index) {
                              return MyButton(
                                child: numberPad[index],
                                onTap: () => buttonTapped(numberPad[index]),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 105,
                          width: 69,
                          decoration: BoxDecoration(
                            color: statusSwitchMode
                                ? Colors.white
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(userAnswer,
                                style: statusSwitchMode
                                    ? _lightBGFont
                                    : _darkBGFont),
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                setState(() {
                                  if (userAnswer.isEmpty) {
                                    userAnswerX = '0';
                                  } else if (userAnswer == '-') {
                                    userAnswer = '-1';
                                  } else {
                                    userAnswerX = userAnswer;
                                  }
                                });
                              },
                              child: Center(
                                child: Text("x",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: statusSwitchMode
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Container(
                            height: 5,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                setState(() {
                                  if (userAnswer.isEmpty) {
                                    userAnswerC = '0';
                                  } else if (userAnswer == '-') {
                                    userAnswer = '-1';
                                  } else {
                                    userAnswerC = userAnswer;
                                  }
                                });
                              },
                              child: Center(
                                child: Text("c",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: statusSwitchMode
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
