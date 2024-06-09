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
    apiKey: 'AIzaSyCZn2qH7xwy4vVJ69V3qNEh28KX3HucJtQ',
    appId: '1:462075678574:web:db643da5a89742fc9d7b7f',
    messagingSenderId: '462075678574',
    projectId: 'facebook-clone-cc444',
    authDomain: 'facebook-clone-cc444.firebaseapp.com',
    storageBucket: 'facebook-clone-cc444.appspot.com',
    measurementId: 'G-Y92HQ71HSV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAngI8LhOUSKITncyj9j27herSN8jNvhr0',
    appId: '1:462075678574:android:92ba7ff7d1419c599d7b7f',
    messagingSenderId: '462075678574',
    projectId: 'facebook-clone-cc444',
    storageBucket: 'facebook-clone-cc444.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9syIdGXwKrP1ICXGcFO2oBAqx7EUy5sc',
    appId: '1:462075678574:ios:9090787299165f8e9d7b7f',
    messagingSenderId: '462075678574',
    projectId: 'facebook-clone-cc444',
    storageBucket: 'facebook-clone-cc444.appspot.com',
    iosBundleId: 'com.example.fbClone',
  );
}
