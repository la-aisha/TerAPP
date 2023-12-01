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
    apiKey: 'AIzaSyCHgmcn9RzhejXkk-g1XulclCJaBnl8Hl8',
    appId: '1:600986156818:web:dab924ebdfb9fde14afdcb',
    messagingSenderId: '600986156818',
    projectId: 'terapp-10b77',
    authDomain: 'terapp-10b77.firebaseapp.com',
    storageBucket: 'terapp-10b77.appspot.com',
    measurementId: 'G-BGQVN031KZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkOWr9HHi_U4eEFoMz4hQVO2ushPSzMJA',
    appId: '1:600986156818:android:e343e84bffe6fa9c4afdcb',
    messagingSenderId: '600986156818',
    projectId: 'terapp-10b77',
    storageBucket: 'terapp-10b77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeGVlj3662ZpA8SKSO7zWLoAutgmcWtW4',
    appId: '1:600986156818:ios:03393edad38640204afdcb',
    messagingSenderId: '600986156818',
    projectId: 'terapp-10b77',
    storageBucket: 'terapp-10b77.appspot.com',
    iosBundleId: 'com.example.ter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeGVlj3662ZpA8SKSO7zWLoAutgmcWtW4',
    appId: '1:600986156818:ios:e1bb1abcb5255c1b4afdcb',
    messagingSenderId: '600986156818',
    projectId: 'terapp-10b77',
    storageBucket: 'terapp-10b77.appspot.com',
    iosBundleId: 'com.example.ter.RunnerTests',
  );
}