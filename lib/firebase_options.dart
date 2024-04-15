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
    apiKey: 'AIzaSyC0zZ-rgjskAveagnwDZOGVeRg4uGv59p0',
    appId: '1:931837864907:web:b42ae2755737d512c3244e',
    messagingSenderId: '931837864907',
    projectId: 'repacuin',
    authDomain: 'repacuin.firebaseapp.com',
    storageBucket: 'repacuin.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgE-ZR6YVIXfXNPJYgVHWFiR8EvxDku1g',
    appId: '1:931837864907:android:b737372d6477d0c5c3244e',
    messagingSenderId: '931837864907',
    projectId: 'repacuin',
    storageBucket: 'repacuin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIk586BWth1VRdIhUyN7HVNTQRGJE0MJo',
    appId: '1:931837864907:ios:7acb8bcadee3b4cdc3244e',
    messagingSenderId: '931837864907',
    projectId: 'repacuin',
    storageBucket: 'repacuin.appspot.com',
    iosClientId: '931837864907-67pelrlk5g9kchttn3pjpf4fi45vjd6u.apps.googleusercontent.com',
    iosBundleId: 'app.ingcontlhsas.flutterFirebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIk586BWth1VRdIhUyN7HVNTQRGJE0MJo',
    appId: '1:931837864907:ios:35a2fd22d15b9d6dc3244e',
    messagingSenderId: '931837864907',
    projectId: 'repacuin',
    storageBucket: 'repacuin.appspot.com',
    iosClientId: '931837864907-hjf42cv530vskp1ba7f6g8dfqtg0kkn2.apps.googleusercontent.com',
    iosBundleId: 'app.ingcontlhsas.flutterFirebaseAuth.RunnerTests',
  );
}
