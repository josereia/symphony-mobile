import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _base = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _authInstance = FirebaseAuth.instance;
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

  void register() {
    Get.offNamed("/register");
  }

  void goBackLogin() {
    Get.offNamed("/login");
  }

  Future<void> createBucket(
      UserCredential credential, String b64ProfilePic) async {
    final String? userUID = _authInstance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();

    if (userUID != null) {
      final userStorageRef = storageRef.child("$userUID/profile");

      try {
        TaskSnapshot result = await userStorageRef.putString(b64ProfilePic,
            format: PutStringFormat.base64);

        final userData = <String, dynamic>{
          "email": credential.user?.email,
          "bucket": result.metadata?.bucket,
          "profilePath": result.metadata?.fullPath
        };
        _base.collection("users").doc(userUID).set(userData);
      } on FirebaseException catch (e) {
        log(e.toString());
      }
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

  void loginWithEmailAndPass(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  void registerWithEmailAndPassword(
      String email, String password, String b64ProfilePic) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((credential) => createBucket(credential, b64ProfilePic));
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
