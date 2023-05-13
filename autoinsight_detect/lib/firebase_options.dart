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
    apiKey: 'AIzaSyCorjJ0KRtT8_31UYZrg5rjN7N5GrKw9zA',
    appId: '1:1073925508284:web:4c34a2cc4c178faedd94b9',
    messagingSenderId: '1073925508284',
    projectId: 'autoinsight-1',
    authDomain: 'autoinsight-1.firebaseapp.com',
    storageBucket: 'autoinsight-1.appspot.com',
    measurementId: 'G-KXR5EE0P74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6H_T7UBpZjMFaez01Y34I_5wD1mcoaKk',
    appId: '1:1073925508284:android:111b5a16daf03606dd94b9',
    messagingSenderId: '1073925508284',
    projectId: 'autoinsight-1',
    storageBucket: 'autoinsight-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8RimFVs6T2URa0z7wH5bDGiusCEae-KY',
    appId: '1:1073925508284:ios:6698597054f9a48edd94b9',
    messagingSenderId: '1073925508284',
    projectId: 'autoinsight-1',
    storageBucket: 'autoinsight-1.appspot.com',
    iosClientId: '1073925508284-aq21uc8hpim63bhnpiq2nbpc27psmrr2.apps.googleusercontent.com',
    iosBundleId: 'com.example.autoinsightDetect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8RimFVs6T2URa0z7wH5bDGiusCEae-KY',
    appId: '1:1073925508284:ios:6698597054f9a48edd94b9',
    messagingSenderId: '1073925508284',
    projectId: 'autoinsight-1',
    storageBucket: 'autoinsight-1.appspot.com',
    iosClientId: '1073925508284-aq21uc8hpim63bhnpiq2nbpc27psmrr2.apps.googleusercontent.com',
    iosBundleId: 'com.example.autoinsightDetect',
  );
}
