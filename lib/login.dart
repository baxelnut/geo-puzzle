// ignore_for_file: unused_local_variable, non_constant_identifier_names, duplicate_ignore

import 'package:geopuzzle/auth.dart';
import 'package:geopuzzle/main.dart';
import 'package:geopuzzle/providers/players.dart';
import 'package:flutter/material.dart';
import 'package:geopuzzle/play.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:geopuzzle/variables.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            child: const LoginPage(),
          ),
        ));
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// final user = FirebaseAuth.instance.currentUser;
// Text _udahlogin = Text(
//   AuthService().checkUser(user),
//   style: const TextStyle(color: Colors.grey, fontSize: 20),
// );
// Text _belumlogin = const Text(
//   "username",
//   style: TextStyle(color: Colors.grey, fontSize: 20),
// );

class _LoginPageState extends State<LoginPage> {
  final user = FirebaseAuth.instance.currentUser;
  // String name = AuthService().checkUser(user);

  @override
  void initState() {
    super.initState();
    // Add a listener to FirebaseAuth for authentication state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // Rebuild the UI when the authentication state changes
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    final displayName = AuthService().getname(user);
    final playerId = AuthService().getId(user);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: Scaffold(
        backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Play()));
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
          title: const Text("Login"),
          backgroundColor: const Color.fromARGB(37, 255, 255, 255),
        ),
        body: Container(
            padding: const EdgeInsets.all(25),
            decoration: statusSwitchMode ? _darkBackground : _lightBackground,
            child: Column(
              children: [
                Container(
                  height: 25,
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
                    title: const Text(
                      "Geo Puzzle",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),

                Container(
                  height: 50,
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(69),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(21, 255, 255, 255),
                      ),
                      child: ElevatedButton(
                        onPressed: null,
                        child: Consumer<AuthService>(
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            builder: (context, AuthService, _) {
                          final user = AuthService
                              .getCurrentUser(); // Retrieve the current user from the provider
                          final userName = AuthService.getname(
                              user); // Get the user name using the updated getname method
                          return Text(
                            userName,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          );
                        }),
                        // loggedin ? _udahlogin : _belumlogin,
                        // // AuthService().checkUser(user),
                      )
                      // TextField(
                      //   textAlign: TextAlign.center,
                      //   decoration: InputDecoration.collapsed(
                      //     hintText: '${_greeting()}',
                      //     hintStyle: const TextStyle(
                      //         fontSize: 20, color: Colors.grey),
                      //   ),
                      // ),
                      ),
                ),
                Container(height: 69),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: Consumer<AuthService>(
                    // ignore: avoid_types_as_parameter_names
                    builder: (context, AuthService, _) {
                      return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.blueGrey),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ))),
                        onPressed: () async {
                          final userCredential =
                              await AuthService.signInWithGoogle();
                          final user = AuthService.getCurrentUser();
                          final userName = AuthService.getname(user);
                          final userId = AuthService.getId(user);
                          await Players().checkAndPostData(userId, userName);
                          String? deviceId = await PlatformDeviceId.getDeviceId;
                          String finalDeviceId = deviceId ?? "";
                          bool data = await Players().checkData(finalDeviceId);
                          if (data == true) {
                            final levelGuest =
                                await Players().getlevel(finalDeviceId);
                            final levelLogin = await Players().getlevel(userId);
                            if (levelLogin <= levelGuest) {
                              Players().uhuyLevel(userName, userId, levelGuest);
                            }
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                Container(height: 30),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Colors.blueGrey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ))),
                    onPressed: () {
                      AuthService().signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OpeningScreen()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
