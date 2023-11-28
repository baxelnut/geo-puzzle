import 'package:flutter/material.dart';
import 'package:geopuzzle/my_button.dart';
import 'package:geopuzzle/play.dart';
import 'package:geopuzzle/result_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:geopuzzle/variables.dart';

class Kartesius5 extends StatefulWidget {
  const Kartesius5({super.key});

  @override
  State<Kartesius5> createState() => _Kartesius5State();
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

class _Kartesius5State extends State<Kartesius5> {
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

  // void jawabanXZ() {
  //   setState(() {
  //     if (userAnswerX == '') {
  //       double jawabanX = 0;
  //     } else {
  //       double jawabanX = double.parse(userAnswerX);
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
      } else if (button == '-') {
        userAnswer = '-1';
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
  //         userAnswerX = '0';
  //       } else if (button == 'DEL') {
  //         // delete the last number
  //         if (int.parse(userAnswerX) > 0) {
  //           userAnswerX = userAnswerX.substring(0, userAnswerX.length - 1);
  //         } else if (int.parse(userAnswerX) <= 0) {
  //           userAnswerX = '0';
  //         }
  //       } else if (userAnswerX.length <= 4) {
  //         // maximum of 4 numbers can be inputted
  //         userAnswerX += button;
  //       }
  //     });
  //   } else if (untuk_x = false) {
  //     setState(() {
  //       if (button == '=') {
  //         // calculate if user is correct or incorrect
  //         checkResult();
  //       } else if (button == 'C') {
  //         // clear the input
  //         userAnswerC = '0';
  //       } else if (button == 'DEL') {
  //         // delete the last number
  //         if (int.parse(userAnswerC) > 0) {
  //           userAnswerC = userAnswerC.substring(0, userAnswerC.length - 1);
  //         } else if (int.parse(userAnswerC) <= 0) {
  //           userAnswerC = '0';
  //         }
  //       } else if (userAnswerC.length <= 4) {
  //         // maximum of 4 numbers can be inputted
  //         userAnswerC += button;
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
  //         userAnswerX = '0';
  //       } else if (untuk_x == false) {
  //         userAnswerC = '0';
  //       }
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (untuk_x == true) {
  //         if (int.parse(userAnswerX) > 0) {
  //           userAnswerX = userAnswerX.substring(0, userAnswerX.length - 1);
  //         } else if (int.parse(userAnswerX) <= 0) {
  //           userAnswerX = '0';
  //         }
  //       } else if (untuk_x == false) {
  //         if (int.parse(userAnswerC) > 0) {
  //           userAnswerX = userAnswerC.substring(0, userAnswerC.length - 1);
  //         } else if (int.parse(userAnswerC) <= 0) {
  //           userAnswerC = '0';
  //         }
  //       }
  //     } else if (userAnswerC.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       if (untuk_x == true) {
  //         userAnswerX += button;
  //       } else if (untuk_x == false) {
  //         userAnswerC += button;
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
  //       userAnswerX = '0';
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (int.parse(userAnswerX) > 0) {
  //         userAnswerX = userAnswerX.substring(0, userAnswerX.length - 1);
  //       } else if (int.parse(userAnswerX) <= 0) {
  //         userAnswerX = '0';
  //       }
  //     } else if (userAnswerX.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       userAnswerX += button;
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
  //       userAnswerC = '0';
  //     } else if (button == 'DEL') {
  //       // delete the last number
  //       if (int.parse(userAnswerC) > 0) {
  //         userAnswerX = userAnswerC.substring(0, userAnswerC.length - 1);
  //       } else if (int.parse(userAnswerC) <= 0) {
  //         userAnswerC = '0';
  //       }
  //     } else if (userAnswerC.length <= 4) {
  //       // maximum of 4 numbers can be inputted
  //       userAnswerC += button;
  //     }
  //   });
  // }

  // check if user is correct or not
  void checkResult() {
    if (int.parse(userAnswerX) > 0 && int.parse(userAnswerC) >= 0) {
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
  //     userAnswerX = '';
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
  //           builder: (BuildContext context) => const Kartesius5()));
  // }

  // double get sbX => 0.0;
  // double get sbY => 0.0;

  // String y1 = "A";
  Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
  Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

  @override
  Widget build(BuildContext context) {
    int maxX = 10;
    int maxY = 10;
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
              title: const Text("Demo 2"),
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
                            primaryXAxis: NumericAxis(crossesAt: 0),
                            primaryYAxis: NumericAxis(crossesAt: 0),
                            enableSideBySideSeriesPlacement: false,
                            // Initialize category axis
                            series: <LineSeries<Input, int>>[
                              LineSeries<Input, int>(
                                  dataSource: <Input>[
                                    Input(0, jawabanC),
                                    Input(jawabanX, jawabanX + jawabanC),
                                    Input(maxX, maxY)
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
                          Text('y = $jawabanX x + $jawabanC',
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
                          //       userAnswerX,
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
                          //       userAnswerX,
                          //       style: whiteTextStyle,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Text('where O = (0,0), P = (10,10)',
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
