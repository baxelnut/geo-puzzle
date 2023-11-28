// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geopuzzle/my_button.dart';
import 'package:geopuzzle/play.dart';
import 'package:geopuzzle/result_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:geopuzzle/variables.dart';

class Kartesius3 extends StatefulWidget {
  const Kartesius3({super.key});

  @override
  State<Kartesius3> createState() => _Kartesius3State();
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

class _Kartesius3State extends State<Kartesius3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: const Stage0(),
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
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
  ];

  // number A, number B
  int numberA = 1;
  int numberB = 1;

  // user answer
  String userAnswer1 = '0';
  String userAnswer2 = '0';
  String userAnswer = '';

  int get jawaban1 => int.parse(userAnswer1);
  int get jawaban2 => int.parse(userAnswer2);

  // void jawaban1Z() {
  //   setState(() {
  //     if (userAnswer1 == '') {
  //       double jawaban1 = 0;
  //     } else {
  //       double jawaban1 = double.parse(userAnswer1);
  //     }
  //   });
  // }

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
      }
    });
  }

  // void buttonTapped(String button) {
  //   if (untuk_x = true) {
  //     setState(() {
  //       if (button == '=') {
  //         // calculate if user is correct or incorrect
  //         checkResult();
  //       } else if (button == 'C') {
  //         // clear the input
  //         userAnswer1 = '0';
  //       } else if (button == 'DEL') {
  //         // delete the last number
  //         if (int.parse(userAnswer1) > 0) {
  //           userAnswer1 = userAnswer1.substring(0, userAnswer1.length - 1);
  //         } else if (int.parse(userAnswer1) <= 0) {
  //           userAnswer1 = '0';
  //         }
  //       } else if (userAnswer1.length <= 4) {
  //         // maximum of 4 numbers can be inputted
  //         userAnswer1 += button;
  //       }
  //     });
  //   } else if (untuk_x = false) {
  //     setState(() {
  //       if (button == '=') {
  //         // calculate if user is correct or incorrect
  //         checkResult();
  //       } else if (button == 'C') {
  //         // clear the input
  //         userAnswer2 = '0';
  //       } else if (button == 'DEL') {
  //         // delete the last number
  //         if (int.parse(userAnswer2) > 0) {
  //           userAnswer2 = userAnswer2.substring(0, userAnswer2.length - 1);
  //         } else if (int.parse(userAnswer2) <= 0) {
  //           userAnswer2 = '0';
  //         }
  //       } else if (userAnswer2.length <= 4) {
  //         // maximum of 4 numbers can be inputted
  //         userAnswer2 += button;
  //       }
  //     });
  //   }
  // }

  // void buttonTapped(String button) {
  //   setState(() {
  //     if (button == '=') {
  //       // calculate if user is correct or incorrect
  //       checkResult();
  //     } else if (button == 'C') {
  //       // clear the input
  //       if (untuk_x == true) {
  //         userAnswer1 = '0';
  //       } else if (untuk_x == false) {
  //         userAnswer2 = '0';
  //       }
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (untuk_x == true) {
  //         if (int.parse(userAnswer1) > 0) {
  //           userAnswer1 = userAnswer1.substring(0, userAnswer1.length - 1);
  //         } else if (int.parse(userAnswer1) <= 0) {
  //           userAnswer1 = '0';
  //         }
  //       } else if (untuk_x == false) {
  //         if (int.parse(userAnswer2) > 0) {
  //           userAnswer1 = userAnswer2.substring(0, userAnswer2.length - 1);
  //         } else if (int.parse(userAnswer2) <= 0) {
  //           userAnswer2 = '0';
  //         }
  //       }
  //     } else if (userAnswer2.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       if (untuk_x == true) {
  //         userAnswer1 += button;
  //       } else if (untuk_x == false) {
  //         userAnswer2 += button;
  //       }
  //     }
  //   });
  // }

  // void buttonTapped_x(String button) {
  //   setState(() {
  //     if (button == '=') {
  //       // calculate if user is correct or incorrect
  //       checkResult();
  //     } else if (button == 'C') {
  //       // clear the input
  //       userAnswer1 = '0';
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (int.parse(userAnswer1) > 0) {
  //         userAnswer1 = userAnswer1.substring(0, userAnswer1.length - 1);
  //       } else if (int.parse(userAnswer1) <= 0) {
  //         userAnswer1 = '0';
  //       }
  //     } else if (userAnswer1.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       userAnswer1 += button;
  //     }
  //   });
  // }

  // void buttonTapped_c(String button) {
  //   setState(() {
  //     if (button == '=') {
  //       // calculate if user is correct or incorrect
  //       checkResult();
  //     } else if (button == 'C') {
  //       // clear the input
  //       userAnswer2 = '0';
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (int.parse(userAnswer2) > 0) {
  //         userAnswer1 = userAnswer2.substring(0, userAnswer2.length - 1);
  //       } else if (int.parse(userAnswer2) <= 0) {
  //         userAnswer2 = '0';
  //       }
  //     } else if (userAnswer2.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       userAnswer2 += button;
  //     }
  //   });
  // }

  // check if user is correct or not
  void checkResult() {
    if (int.parse(userAnswer1) > 0 && int.parse(userAnswer2) >= 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Nice!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
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

  // create random numbers
  // var randomNumber = Random();

  // // GO TO NEXT QUESTION
  // void goToNextQuestion() {
  //   // dismiss alert dialog
  //   Navigator.of(context).pop();

  //   // reset values
  //   setState(() {
  //     userAnswer1 = '';
  //   });

  //   // create a new question
  //   numberA = randomNumber.nextInt(10);
  //   numberB = randomNumber.nextInt(10);
  // }

  void goToNextQuestion() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const Play()));
  }

  // GO BACK TO QUESTION
  // void goBackToQuestion() {
  //   // dismiss alert dialog
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => const Kartesius3()));
  // }

  // double get sbX => 0.0;
  // double get sbY => 0.0;

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
              title: const Text("Level 3"),
              backgroundColor: const Color.fromARGB(37, 255, 255, 255),
            ),
            body: Container(
              decoration: statusSwitchMode ? _darkBackground : _lightBackground,
              child: Column(
                children: [
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
                            // Initialize category axis
                            series: <LineSeries<Input, int>>[
                              LineSeries<Input, int>(
                                  dataSource: <Input>[
                                    Input(0, jawaban2),
                                    Input(jawaban1, jawaban1 + jawaban2),
                                  ],
                                  xValueMapper: (Input sbX, _) => sbX.sbY,
                                  yValueMapper: (Input sbX, _) => sbX.sbX)
                            ]),
                      ),
                    ),
                  ),
                  // question
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // question
                          // Text(
                          //   '$numberA + $numberB = ',
                          //   style: whiteTextStyle,
                          // ),

                          // question y=ax+c
                          Text('y = $jawaban1 x + $jawaban2 ',
                              style: statusSwitchMode
                                  ? _darkBGFont
                                  : _lightBGFont),

                          // answer box X
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //     color: statusSwitchMode
                          //         ? colorfulBGTZ
                          //         : tidakcolorful,
                          //     borderRadius: BorderRadius.circular(3),
                          //   ),
                          //   child: Center(
                          //     child: Text(
                          //       userAnswer1,
                          //       style: whiteTextStyle,
                          //     ),
                          //   ),
                          // ), // answer box c
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //     color: statusSwitchMode
                          //         ? colorfulBGTZ
                          //         : tidakcolorful,
                          //     borderRadius: BorderRadius.circular(3),
                          //   ),
                          //   child: Center(
                          //     child: Text(
                          //       userAnswer1,
                          //       style: whiteTextStyle,
                          //     ),
                          //   ),
                          // )
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
                        height: 200,
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
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 105,
                          width: 69,
                          decoration: BoxDecoration(
                            color:
                                statusSwitchMode ? Colors.white : tidakcolorful,
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
                                  backgroundColor: statusSwitchMode
                                      ? colorfulBGTZ
                                      : tidakcolorful,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                setState(() {
                                  if (userAnswer.isEmpty) {
                                    userAnswer1 = '0';
                                  } else {
                                    userAnswer1 = userAnswer;
                                  }
                                });
                              },
                              child: const Center(
                                child: Text("x",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
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
                                  backgroundColor: statusSwitchMode
                                      ? colorfulBGTZ
                                      : tidakcolorful,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                setState(() {
                                  if (userAnswer.isEmpty) {
                                    userAnswer2 = '0';
                                  } else {
                                    userAnswer2 = userAnswer;
                                  }
                                });
                              },
                              child: const Center(
                                child: Text("c",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
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
            )
            // body: Center(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: MediaQuery.of(context).size.height * 0.91,
            //         decoration:
            //             statusSwitchMode ? _darkBackground : _lightBackground,
            //         child: Padding(
            //           padding: const EdgeInsets.all(25),
            //           child: Column(
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(25),
            //                   color: Colors.white,
            //                 ),
            //                 child: SizedBox(
            //                   width: MediaQuery.of(context).size.width,
            //                   height: MediaQuery.of(context).size.height * 0.50,
            //                   child: SfCartesianChart(
            //                       // Initialize category axis
            //                       series: <LineSeries<Input, double>>[
            //                         LineSeries<Input, double>(
            //                             dataSource: <Input>[
            //                               Input(0, 0),
            //                               Input(0, 5),
            //                             ],
            //                             xValueMapper: (Input sbX, _) => sbX.sbY,
            //                             yValueMapper: (Input sbX, _) => sbX.sbX)
            //                       ]),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ),
      ),
    );
  }
}
