import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geopuzzle/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 1000,
        backgroundColor: const Color.fromARGB(196, 30, 39, 66),
        splash: Image.asset("assets/images/logo_geo_p.png"),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const OpeningScreen(),
      ),
    );
  }
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(196, 30, 39, 66),
        body: Container(
          decoration: statusSwitchMode ? _darkBackground : _lightBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                  color: Colors.white,
                  child: const Text(
                    "Geo Puzzle",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_arrow_rounded),
                    iconSize: 190,
                    color: const Color.fromARGB(130, 255, 255, 255),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                  )
                ],
              ),
              Title(
                color: Colors.white,
                child: const Text(
                  "by ABC Group",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
