import 'package:geopuzzle/homescreen.dart';
import 'package:geopuzzle/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  AuthService();

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginPage();
          }
        });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

    return userCredential;
  }

  void signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  String checkUser(user) {
    if (user != null) {
      final displayName = user.displayName;
      // do something with displayName
      return displayName;
    } else {
      // handle case where there is no signed-in user
      return "";
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  String getId(user) {
    if (user != null) {
      final displayName = user.uid;
      // do something with displayName
      return displayName;
    } else {
      // handle case where there is no signed-in user
      return "";
    }
  }

  String getname(User? user) {
    if (user != null) {
      final displayName = user.displayName;
      // do something with displayName
      return displayName ?? "";
    } else {
      // handle case where there is no signed-in user
      return "";
    }
  }
}
