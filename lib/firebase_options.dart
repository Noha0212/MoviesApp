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
        return macos;
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
    apiKey: 'AIzaSyBFdU2O3cvd9GPM1JRKu9gQzQtX5vlmr20',
    appId: '1:114826790192:web:631c1e39ca8b9efc3174f5',
    messagingSenderId: '114826790192',
    projectId: 'os2project-ca75c',
    authDomain: 'os2project-ca75c.firebaseapp.com',
    storageBucket: 'os2project-ca75c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmrgOdv_iZi6b1n-7knxwdctBmFfV1IbE',
    appId: '1:114826790192:android:64d7caf0ef92ae153174f5',
    messagingSenderId: '114826790192',
    projectId: 'os2project-ca75c',
    storageBucket: 'os2project-ca75c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7qKc_u6Lbke-UUf6ywU8NRJmFNVn9X64',
    appId: '1:114826790192:ios:ea1ea356913243823174f5',
    messagingSenderId: '114826790192',
    projectId: 'os2project-ca75c',
    storageBucket: 'os2project-ca75c.appspot.com',
    iosBundleId: 'com.example.os2Project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7qKc_u6Lbke-UUf6ywU8NRJmFNVn9X64',
    appId: '1:114826790192:ios:ea1ea356913243823174f5',
    messagingSenderId: '114826790192',
    projectId: 'os2project-ca75c',
    storageBucket: 'os2project-ca75c.appspot.com',
    iosBundleId: 'com.example.os2Project',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFdU2O3cvd9GPM1JRKu9gQzQtX5vlmr20',
    appId: '1:114826790192:web:e03570e73d96e2a23174f5',
    messagingSenderId: '114826790192',
    projectId: 'os2project-ca75c',
    authDomain: 'os2project-ca75c.firebaseapp.com',
    storageBucket: 'os2project-ca75c.appspot.com',
  );
}
