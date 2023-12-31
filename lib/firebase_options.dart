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
    apiKey: 'AIzaSyCPxAzaBW7ou2GKEoNJv6i-E69p0ql90Gg',
    appId: '1:685766664607:web:9559e3ba9185dacc2dddaa',
    messagingSenderId: '685766664607',
    projectId: 'apptreino-n2',
    authDomain: 'apptreino-n2.firebaseapp.com',
    storageBucket: 'apptreino-n2.appspot.com',
    measurementId: 'G-WLEGEFWTHV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrVgh-WMyAcJDXhjA2EG2zcehpQ3oXXdU',
    appId: '1:685766664607:android:a019340a04b5a6852dddaa',
    messagingSenderId: '685766664607',
    projectId: 'apptreino-n2',
    storageBucket: 'apptreino-n2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4r-HEKaXhR2k3qQ7f2oa--LbkNrGX0Y4',
    appId: '1:685766664607:ios:57f61f564c78e8122dddaa',
    messagingSenderId: '685766664607',
    projectId: 'apptreino-n2',
    storageBucket: 'apptreino-n2.appspot.com',
    iosBundleId: 'com.example.training',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4r-HEKaXhR2k3qQ7f2oa--LbkNrGX0Y4',
    appId: '1:685766664607:ios:38082a15c4fd57382dddaa',
    messagingSenderId: '685766664607',
    projectId: 'apptreino-n2',
    storageBucket: 'apptreino-n2.appspot.com',
    iosBundleId: 'com.example.training.RunnerTests',
  );
}
