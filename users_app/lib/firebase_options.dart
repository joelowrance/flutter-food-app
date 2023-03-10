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
    apiKey: 'AIzaSyDF9UBOCxD8_VBLQ4wiRzAgXRe91dDfbs0',
    appId: '1:927319245392:web:35399f09fed3bd0c120755',
    messagingSenderId: '927319245392',
    projectId: 'foodpandaclone-dc666',
    authDomain: 'foodpandaclone-dc666.firebaseapp.com',
    storageBucket: 'foodpandaclone-dc666.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF5JZKU2w4UfYkp1SLj_2vn6SfGXQQLew',
    appId: '1:927319245392:android:f4830a6badd0906b120755',
    messagingSenderId: '927319245392',
    projectId: 'foodpandaclone-dc666',
    storageBucket: 'foodpandaclone-dc666.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUGEr89wjZJLcKP6Xzj5_JEPDf6kXedmE',
    appId: '1:927319245392:ios:16c7ec3e918041cf120755',
    messagingSenderId: '927319245392',
    projectId: 'foodpandaclone-dc666',
    storageBucket: 'foodpandaclone-dc666.appspot.com',
    iosClientId: '927319245392-8n1u33c8h782t8inafsi31q9961r5sge.apps.googleusercontent.com',
    iosBundleId: 'com.example.usersApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUGEr89wjZJLcKP6Xzj5_JEPDf6kXedmE',
    appId: '1:927319245392:ios:16c7ec3e918041cf120755',
    messagingSenderId: '927319245392',
    projectId: 'foodpandaclone-dc666',
    storageBucket: 'foodpandaclone-dc666.appspot.com',
    iosClientId: '927319245392-8n1u33c8h782t8inafsi31q9961r5sge.apps.googleusercontent.com',
    iosBundleId: 'com.example.usersApp',
  );
}
