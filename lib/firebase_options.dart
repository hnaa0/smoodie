// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCiSSNpBtNs0Llo2j3hGPnuT7jmXm7_lxg',
    appId: '1:422717374065:web:666f51ece97488dc4aa5d0',
    messagingSenderId: '422717374065',
    projectId: 'smoodie-85f91',
    authDomain: 'smoodie-85f91.firebaseapp.com',
    storageBucket: 'smoodie-85f91.appspot.com',
    measurementId: 'G-3LRMY9JTY8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtFpRGIEWnPi2syoLZUKUk64LeBR9WZFQ',
    appId: '1:422717374065:android:ac3c03b8a7fdc8f04aa5d0',
    messagingSenderId: '422717374065',
    projectId: 'smoodie-85f91',
    storageBucket: 'smoodie-85f91.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKM5dYlR4iefAd_n82oEgj1VL0Ayg2fe4',
    appId: '1:422717374065:ios:6ad4d7983ba292994aa5d0',
    messagingSenderId: '422717374065',
    projectId: 'smoodie-85f91',
    storageBucket: 'smoodie-85f91.appspot.com',
    iosBundleId: 'com.example.smoodie',
  );

}