import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late Rx<User?> _firebaseUser = _auth.currentUser.obs;
  late Rx<GoogleSignInAccount?> _googleUser = _googleSignIn.currentUser.obs;

  User? get user => _firebaseUser.value;

  void _checkLogin(user) {
    if (user != null) {
      Get.offNamed("/");
    } else {
      Get.offNamed("/login");
    }
  }

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _googleUser = Rx<GoogleSignInAccount?>(_googleSignIn.currentUser);

    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, (User? user) {
      _checkLogin(user);
    });

    _googleUser.bindStream(_googleSignIn.onCurrentUserChanged);
    ever(_googleUser, (GoogleSignInAccount? user) {
      _checkLogin(user);
    });

    super.onReady();
  }

  void loginWithEmailAndPass(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  void loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _auth.signInWithCredential(authCredential);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
