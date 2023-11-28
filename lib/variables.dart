// import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

bool statusSwitch = true;
bool statusSwitchMode = true;

bool statusSwitchColorful = false;
bool statusSwitchModeColorful = false;

bool statusSwitchExtraColorful = false;
bool statusSwitchModeExtraColorful = false;

bool statusSwitchSound = false;
bool isPlaying = false;

// double y1 = 0;

bool loggedin = true;

var whiteTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.white,
);

bool untuk_x = false;

//audio
bool DJ = true;

void benar() {
  Future<void> musiks = AssetsAudioPlayer.newPlayer().open(
    Audio('assets/audio/congratulations.mp3'),
    // loopMode: LoopMode.single
  );
}

void salah() {
  Future<void> musiks = AssetsAudioPlayer.newPlayer().open(
    Audio('assets/audio/rizz.mp3'),
    // loopMode: LoopMode.single
  );
}
