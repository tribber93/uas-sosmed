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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD8Tz8PH7r_KD_x0Ou6NEjd908WRWW3ES0',
    appId: '1:1049770763236:web:a14a864dc1bbd946405df1',
    messagingSenderId: '1049770763236',
    projectId: 'uas-sosmed-d42c8',
    authDomain: 'uas-sosmed-d42c8.firebaseapp.com',
    storageBucket: 'uas-sosmed-d42c8.appspot.com',
    measurementId: 'G-NFKL3T9R76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZeQPKYObznIbaeDdAdocKdIrPliGb5lQ',
    appId: '1:1049770763236:android:d7647c30e1199bdd405df1',
    messagingSenderId: '1049770763236',
    projectId: 'uas-sosmed-d42c8',
    storageBucket: 'uas-sosmed-d42c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6ELvr0zy_8OZe-2jw4CZ-iwGPPpkG5jM',
    appId: '1:1049770763236:ios:8545e914680b6464405df1',
    messagingSenderId: '1049770763236',
    projectId: 'uas-sosmed-d42c8',
    storageBucket: 'uas-sosmed-d42c8.appspot.com',
    iosClientId: '1049770763236-gls9trhjjp23e51ern1p5kqulgqvcm3v.apps.googleusercontent.com',
    iosBundleId: 'com.example.uasSosmed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6ELvr0zy_8OZe-2jw4CZ-iwGPPpkG5jM',
    appId: '1:1049770763236:ios:8545e914680b6464405df1',
    messagingSenderId: '1049770763236',
    projectId: 'uas-sosmed-d42c8',
    storageBucket: 'uas-sosmed-d42c8.appspot.com',
    iosClientId: '1049770763236-gls9trhjjp23e51ern1p5kqulgqvcm3v.apps.googleusercontent.com',
    iosBundleId: 'com.example.uasSosmed',
  );
}
