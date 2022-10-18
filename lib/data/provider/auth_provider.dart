import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Future<String?> _createBucket(
    UserCredential credential,
    String b64ProfilePic,
  ) async {
    final String? userUID = _authInstance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();

    if (userUID != null) {
      final userStorageRef = storageRef.child("$userUID/profile");

      try {
        await userStorageRef.putString(
          b64ProfilePic,
          format: PutStringFormat.base64,
        );

        return userStorageRef.getDownloadURL();
      } on FirebaseException catch (e) {
        log(e.toString());
      }
    }

    return null;
  }

  Future<UserCredential?> loginWithEmailAndPass(
    String email,
    String password,
  ) async {
    return await _authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _authInstance.signInWithCredential(credential).then(
          (value) => value.user,
        );
  }

  Future<void> logOut() async {
    return await _authInstance.signOut();
  }

  Future<void> registerWithEmailAndPassword(
    String username,
    String email,
    String password,
    String b64ProfilePic,
  ) async {
    return await _authInstance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (credential) {
        credential.user?.updateDisplayName(username).then(
              (value) => _createBucket(credential, b64ProfilePic).then(
                (value) => credential.user?.updatePhotoURL(value),
              ),
            );
      },
    );
  }
}
