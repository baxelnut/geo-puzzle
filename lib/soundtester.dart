// // ignore_for_file: non_constant_identifier_names, unused_element

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// AudioPlayer? player;

// class SoundTester extends StatelessWidget {
//   const SoundTester({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: AppRoutes.SoundTesterz,
//       routes: {
//         AppRoutes.SoundTesterz: (context) => const SoundTesterz(),
//       },
//       title: _title,
//       // SoundTesterz: ,
//     );
//   }
// }

// class SoundTesterz extends StatelessWidget {
//   const SoundTesterz({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("title")),
//       body: const Center(
//         child: AudioPlayers(),
//       ),
//     );
//   }
// }

// class AppRoutes {
//   static String SoundTesterz = "/";
// }

// Duration _position = const Duration(seconds: 0);
// var _progress = 0.0;

// class AudioPlayers extends StatefulWidget {
//   const AudioPlayers({Key? key}) : super(key: key);

//   @override
//   State<AudioPlayers> createState() => _AudioPlayersState();
// }

// class _AudioPlayersState extends State<AudioPlayers> {
//   Timer? timer2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           LinearProgressIndicator(
//             value: _progress,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     player!.setAsset('assets/mb3.mp3').then((value) {
//                       return {
//                         _position = value!,
//                         player!.playerStateStream.listen((state) {
//                           if (state.playing) {
//                             setState(() {
//                               _progress = .1;
//                             });
//                           } else {
//                             switch (state.processingState) {
//                               case ProcessingState.idle:
//                                 break;
//                               case ProcessingState.loading:
//                                 break;
//                               case ProcessingState.buffering:
//                                 break;
//                               case ProcessingState.ready:
//                                 setState(() {
//                                   _progress = 0;
//                                   timer2!.cancel();
//                                 });
//                                 break;
//                               case ProcessingState.completed:
//                                 setState(() {
//                                   _progress = 1;
//                                 });
//                                 break;
//                             }
//                           }
//                         }),
//                         player!.play(),
//                         timer2 =
//                             Timer.periodic(const Duration(seconds: 1), (timer) {
//                           setState(() {
//                             _progress += .05;
//                           });
//                         })
//                       };
//                     });
//                   },
//                   icon: Icon(
//                     _progress > 0 ? Icons.pause : Icons.play_circle_fill,
//                     size: 45,
//                   )),
//               const SizedBox(
//                 width: 45,
//               ),
//               IconButton(
//                   onPressed: () {
//                     player!.stop();
//                     timer2!.cancel();
//                   },
//                   icon: const Icon(
//                     Icons.stop,
//                     size: 45,
//                   )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
