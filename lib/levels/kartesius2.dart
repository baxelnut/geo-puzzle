// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:geopuzzle/play.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:geopuzzle/variables.dart';

class Kartesius2 extends StatefulWidget {
  const Kartesius2({super.key});

  @override
  State<Kartesius2> createState() => _Kartesius2State();
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

class _Kartesius2State extends State<Kartesius2> {
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
  final double sbY;
  final double sbX;
}

class _Stage0State extends State<Stage0> {
  double get sbX => 0.0;
  double get sbY => 0.0;

  String y1 = "A";
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
          body: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.91,
                    decoration:
                        statusSwitchMode ? _darkBackground : _lightBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.69,
                              child: SfCartesianChart(
                                  // Initialize category axis
                                  series: <LineSeries<Input, double>>[
                                    LineSeries<Input, double>(
                                        dataSource: <Input>[
                                          Input(0, 0),
                                          Input(0, 5),
                                        ],
                                        xValueMapper: (Input sbX, _) => sbX.sbY,
                                        yValueMapper: (Input sbX, _) => sbX.sbX)
                                  ]),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.0619,
                          ),
                          Row(
                            children: [
                              // input
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.138,
                                  height:
                                      MediaQuery.of(context).size.width * 0.125,
                                  child: const Center(
                                    child: Text(
                                      "y =",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 30, right: 30),
                                  child: MathField(
                                    autofocus: false,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: "..."),
                                    onSubmitted: (value) {
                                      setState(() {
                                        y1 = value;
                                        Input sbX = value as Input;
                                      });
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        y1 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.138,
                                  height:
                                      MediaQuery.of(context).size.width * 0.125,
                                  child: const Center(
                                    child: Text(
                                      "x  + ",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 30, right: 30),
                                  child: MathField(
                                    decoration: const InputDecoration.collapsed(
                                        hintText: "..."),
                                    autofocus: false,
                                    onSubmitted: (value) {
                                      y1 = value;
                                    },
                                    onChanged: (value) {
                                      y1 = value;
                                      // String expression;
                                      // try {
                                      //   expression =
                                      //       '${TeXParser(value).parse()}';
                                      // } catch (_) {
                                      //   expression = 'invalid input';
                                      // }
                                      // print('input expression: $value\n'
                                      //     'converted expression: $expression');
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              // enter
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.width * 0.19,
                                  child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                          padding:
                                              const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                                  EdgeInsets.only(left: 10)),
                                          iconColor:
                                              const MaterialStatePropertyAll<Color>(
                                                  Colors.grey),
                                          backgroundColor:
                                              const MaterialStatePropertyAll<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25)))),
                                      onPressed: () {
                                        // double sbX = x;
                                        // double sbY = y;
                                      },
                                      icon: const Icon(Icons.send_rounded),
                                      label: const Text(""))),
                            ],
                          ),
                          Container(
                            height: 25,
                            width: 100,
                            color: Colors.amber,
                            child: Center(child: Text(y1)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
