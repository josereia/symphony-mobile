// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCC6iNSQDYtrd3Fs_GQDiE5piMpRYFH0g8',
    appId: '1:819828396310:web:fa5f8d9542258b645c0037',
    messagingSenderId: '819828396310',
    projectId: 'symphony-61682',
    authDomain: 'symphony-61682.firebaseapp.com',
    storageBucket: 'symphony-61682.appspot.com',
    measurementId: 'G-L2X48E8S83',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDx-jCpKmFKB5E56LvIO42sNgKaoBNuwA',
    appId: '1:819828396310:android:912e058b645bdc735c0037',
    messagingSenderId: '819828396310',
    projectId: 'symphony-61682',
    storageBucket: 'symphony-61682.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPWMk7PN1OANk7XeV_05IlC3PxnXlh7DM',
    appId: '1:819828396310:ios:318c65d7413e126c5c0037',
    messagingSenderId: '819828396310',
    projectId: 'symphony-61682',
    storageBucket: 'symphony-61682.appspot.com',
    androidClientId: '819828396310-sa88hv3g91phcon18cgmjndqd4th5kn8.apps.googleusercontent.com',
    iosClientId: '819828396310-be8ms9qdaqno0u66unj2rc2furrkm0o1.apps.googleusercontent.com',
    iosBundleId: 'br.com.jotaon.symphony',
  );
}
