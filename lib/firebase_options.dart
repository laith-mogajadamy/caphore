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
    apiKey: 'AIzaSyDV3I8nrZnywdwPj4IF-Odq0dxlMD9Gti8',
    appId: '1:618408868435:web:8f9773c18d7768735e64a6',
    messagingSenderId: '618408868435',
    projectId: 'caphore-2c2f3',
    authDomain: 'caphore-2c2f3.firebaseapp.com',
    storageBucket: 'caphore-2c2f3.firebasestorage.app',
    measurementId: 'G-G4G9PRVKWK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6BcDLXQb6dVU0c2Rum8W-Y_1X5Jg9k80',
    appId: '1:618408868435:android:be641fd9a8fe422a5e64a6',
    messagingSenderId: '618408868435',
    projectId: 'caphore-2c2f3',
    storageBucket: 'caphore-2c2f3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtwF5snQW1HRDR-oQ0ggiV3flQCEVM2Tk',
    appId: '1:618408868435:ios:aba93751c525cb4a5e64a6',
    messagingSenderId: '618408868435',
    projectId: 'caphore-2c2f3',
    storageBucket: 'caphore-2c2f3.firebasestorage.app',
    iosBundleId: 'sy.caphore',
  );
}
