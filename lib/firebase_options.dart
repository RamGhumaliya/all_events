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
    apiKey: 'AIzaSyBYAbEqnungHYjhGbrs2IolRkltaHRTbHg',
    appId: '1:284461387091:web:297c2c0be53ccbc8d8a5a6',
    messagingSenderId: '284461387091',
    projectId: 'social-media-3df0b',
    authDomain: 'social-media-3df0b.firebaseapp.com',
    databaseURL: 'https://social-media-3df0b-default-rtdb.firebaseio.com',
    storageBucket: 'social-media-3df0b.appspot.com',
    measurementId: 'G-VGQ08B7FVB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9fB_WnOJajFyljVszNuUwvTe0_AWp3C0',
    appId: '1:284461387091:android:6bd5d4ff7193ffe4d8a5a6',
    messagingSenderId: '284461387091',
    projectId: 'social-media-3df0b',
    databaseURL: 'https://social-media-3df0b-default-rtdb.firebaseio.com',
    storageBucket: 'social-media-3df0b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD95sT4EV4kUungUYAM5AubEw5S4VsiFnc',
    appId: '1:284461387091:ios:71828fb3bac0a291d8a5a6',
    messagingSenderId: '284461387091',
    projectId: 'social-media-3df0b',
    databaseURL: 'https://social-media-3df0b-default-rtdb.firebaseio.com',
    storageBucket: 'social-media-3df0b.appspot.com',
    androidClientId: '284461387091-jrdahf8vchhsfjph77s4au019oii0jdv.apps.googleusercontent.com',
    iosClientId: '284461387091-4i3j63luop6lpdj00e0sah81k0s15vg7.apps.googleusercontent.com',
    iosBundleId: 'com.example.allEvents',
  );
}
