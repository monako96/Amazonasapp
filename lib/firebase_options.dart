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
    apiKey: 'AIzaSyDr1NNtj8dFj9EkEBwYLvdrOfmZqVURW3U',
    appId: '1:959885436134:web:dad76e03a40076aea30727',
    messagingSenderId: '959885436134',
    projectId: 'appas-a4b22',
    authDomain: 'appas-a4b22.firebaseapp.com',
    storageBucket: 'appas-a4b22.appspot.com',
    measurementId: 'G-E7EY052864',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB-c1nnN9wzpE3ITyDZ3Qf3bBQjTUjjRw',
    appId: '1:959885436134:android:71a19f51e53541eca30727',
    messagingSenderId: '959885436134',
    projectId: 'appas-a4b22',
    storageBucket: 'appas-a4b22.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANQZksvYGdL7a7Y6jxvUk9SD4lKOF1BiE',
    appId: '1:959885436134:ios:d229abda21dd3729a30727',
    messagingSenderId: '959885436134',
    projectId: 'appas-a4b22',
    storageBucket: 'appas-a4b22.appspot.com',
    iosClientId: '959885436134-35tcn3go7fqvfq2j2a8ct80oi6ubke42.apps.googleusercontent.com',
    iosBundleId: 'com.example.appamazonas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANQZksvYGdL7a7Y6jxvUk9SD4lKOF1BiE',
    appId: '1:959885436134:ios:a83b2888930ab7c1a30727',
    messagingSenderId: '959885436134',
    projectId: 'appas-a4b22',
    storageBucket: 'appas-a4b22.appspot.com',
    iosClientId: '959885436134-shna0r0dl1ce96rud51m6rf0j2ear2bl.apps.googleusercontent.com',
    iosBundleId: 'com.example.appamazonas.RunnerTests',
  );
}
