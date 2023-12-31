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
    apiKey: 'AIzaSyCvba0HdAZcZ-SNe0ppcPPQllOUC9dfATE',
    appId: '1:235411080738:web:c238f3f6ee4fb160642c7b',
    messagingSenderId: '235411080738',
    projectId: 'stepperauth',
    authDomain: 'stepperauth.firebaseapp.com',
    storageBucket: 'stepperauth.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIr8H8v9OIL3qNrLIfUXqmjimU-0VHVgk',
    appId: '1:235411080738:android:189bd83473c960d8642c7b',
    messagingSenderId: '235411080738',
    projectId: 'stepperauth',
    storageBucket: 'stepperauth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB806iJbABuK-MHp6H_w8Ued-TQnBu4hBY',
    appId: '1:235411080738:ios:e7980c11279de653642c7b',
    messagingSenderId: '235411080738',
    projectId: 'stepperauth',
    storageBucket: 'stepperauth.appspot.com',
    iosBundleId: 'com.example.bigSteppaPhilippOleg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB806iJbABuK-MHp6H_w8Ued-TQnBu4hBY',
    appId: '1:235411080738:ios:51848753f82e06b8642c7b',
    messagingSenderId: '235411080738',
    projectId: 'stepperauth',
    storageBucket: 'stepperauth.appspot.com',
    iosBundleId: 'com.example.bigSteppaPhilippOleg.RunnerTests',
  );
}