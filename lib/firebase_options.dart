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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDPC_3A6aMwOyIweC9MROSaxPpsMA6PEBE',
    appId: '1:1066785379873:web:ad9bb81a3ef00da9c03560',
    messagingSenderId: '1066785379873',
    projectId: 'goal-getter-app-3f09c',
    authDomain: 'goal-getter-app-3f09c.firebaseapp.com',
    storageBucket: 'goal-getter-app-3f09c.appspot.com',
    measurementId: 'G-JPRB581JW3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQcAtIc-641j3iHcaGE4cxlJeAHyZxoL4',
    appId: '1:1066785379873:android:690b7785342f87f1c03560',
    messagingSenderId: '1066785379873',
    projectId: 'goal-getter-app-3f09c',
    storageBucket: 'goal-getter-app-3f09c.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPC_3A6aMwOyIweC9MROSaxPpsMA6PEBE',
    appId: '1:1066785379873:web:46e25488ea4ec2fbc03560',
    messagingSenderId: '1066785379873',
    projectId: 'goal-getter-app-3f09c',
    authDomain: 'goal-getter-app-3f09c.firebaseapp.com',
    storageBucket: 'goal-getter-app-3f09c.appspot.com',
    measurementId: 'G-G1FVW0DKPJ',
  );

}