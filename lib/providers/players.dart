// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/player.dart';
import 'package:firebase_database/firebase_database.dart';

class Players with ChangeNotifier {
  final List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  // String getId() {
  //   Uri url = Uri.parse(
  //       "https://geopuzzle-189b4-default-rtdb.firebaseio.com/players.json");

  //   return json.decode(allPlayer.body)['name'];
  // }

  Future<void> addPlayer(String name, String uid) {
    Uri url =
        Uri.parse("https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          uid: {
            "name": name,
            "uid": uid,
            "level": 0,
          },
        },
      ),
    )
        .then(
      (response) {
        _allPlayer.add(
          Player(
            id: json.decode(response.body)['name'].toString(),
            uid: uid,
            name: name,
            level: 0,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> levelup(String id, int level) {
    Uri url = Uri.parse(
        "https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/players/$id/.json");
    return http
        .patch(
      url,
      body: json.encode(
        {
          "level": level,
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.level = level;

        notifyListeners();
      },
    );
  }

  void editPlayer(String id, int level, BuildContext context) {
    Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
    selectPlayer.level = level;

    notifyListeners();
  }

  // void deletePlayer(String id, BuildContext context) {
  //   _allPlayer.removeWhere((element) => element.id == id);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text("Berhasil dihapus"),
  //       duration: Duration(milliseconds: 500),
  //     ),
  //   );
  //   notifyListeners();
  // }
  Future<int> getlevel(String uid) async {
    Uri url = Uri.parse(
        "https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/players/$uid/level.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final level = data as int;
    return level;
  }

  Future<int> checkdata(String uid) async {
    Uri url = Uri.parse(
        "https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/players/$uid.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    return data;
  }
// ignore: deprecated_member_use

  void uhuy(String name, String uid) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('players/$uid');
    reference.set({
      "name": name,
      "uid": uid,
      "level": 0,
    });
  }

  void uhuyLevel(String name, String uid, int level) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('players/$uid');
    reference.set({
      "name": name,
      "uid": uid,
      "level": level,
    });
  }

  Future<void> uhuyno(String uid, int level) async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('players/$uid');
    reference.set({
      "uid": uid,
      "level": level,
    });
  }

  Future<void> checkAndPostData(String uid, String name) async {
    const databaseUrl =
        "https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/players/.json";

    final response = await http.get(Uri.parse(databaseUrl));
    final data = json.decode(response.body);

    if (data != null) {
      final bool uidExists = data.containsKey(uid);

      if (!uidExists) {
        // UID doesn't exist, perform POST request
        uhuy(name, uid);
        print('Data posted successfully!');
      } else {
        // UID already exists, skip POST request
        print('UID already exists in the database, skipping data post.');
      }
    }
  }

  Future checkData(String uid) async {
    const databaseUrl =
        "https://geopuzzle-4a3b9-default-rtdb.firebaseio.com/players/.json";

    final response = await http.get(Uri.parse(databaseUrl));
    final data = json.decode(response.body);
    final data1 = json.decode(response.body)["level"];

    if (data != null) {
      final bool uidExists = data.containsKey(uid);

      if (!uidExists) {
        // UID doesn't exist, perform POST request

        print('gaada');
        return false;
      } else {
        // UID already exists, skip POST request
        print('ada');
        return true;
      }
    }
  }
}
