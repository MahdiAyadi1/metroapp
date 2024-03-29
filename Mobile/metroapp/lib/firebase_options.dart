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
    apiKey: 'AIzaSyDahcsk43A6YCOd3k00oGtjY92uDr9ClLw',
    appId: '1:642364952017:web:2734ea6ba195bcd83fe4f0',
    messagingSenderId: '642364952017',
    projectId: 'metroapp-957a0',
    authDomain: 'metroapp-957a0.firebaseapp.com',
    databaseURL: 'https://metroapp-957a0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'metroapp-957a0.appspot.com',
    measurementId: 'G-FXTGM5MHNM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAO7JSl94DtL3yLPUx7UUvULnl7sbvoEg',
    appId: '1:642364952017:android:2b72c488d218e3da3fe4f0',
    messagingSenderId: '642364952017',
    projectId: 'metroapp-957a0',
    databaseURL: 'https://metroapp-957a0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'metroapp-957a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM32PSE1lj8QTHcy7hAQ9kuVWQSzhlrnk',
    appId: '1:642364952017:ios:81a4c5edafa6a5133fe4f0',
    messagingSenderId: '642364952017',
    projectId: 'metroapp-957a0',
    databaseURL: 'https://metroapp-957a0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'metroapp-957a0.appspot.com',
    iosClientId: '642364952017-s426a78s7rrsj6b32558llifafe6ibsb.apps.googleusercontent.com',
    iosBundleId: 'com.example.metroapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBM32PSE1lj8QTHcy7hAQ9kuVWQSzhlrnk',
    appId: '1:642364952017:ios:81a4c5edafa6a5133fe4f0',
    messagingSenderId: '642364952017',
    projectId: 'metroapp-957a0',
    databaseURL: 'https://metroapp-957a0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'metroapp-957a0.appspot.com',
    iosClientId: '642364952017-s426a78s7rrsj6b32558llifafe6ibsb.apps.googleusercontent.com',
    iosBundleId: 'com.example.metroapp',
  );
}
