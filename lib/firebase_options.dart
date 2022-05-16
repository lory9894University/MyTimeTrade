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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBymty19Ppf7MR7aUcvbxElblVs3MpveEw',
    appId: '1:1012941757457:android:c726e9f8f0e76ee876e5b0',
    messagingSenderId: '1012941757457',
    projectId: 'mytimetrade-8ef71',
    databaseURL: 'https://mytimetrade-8ef71-default-rtdb.firebaseio.com',
    storageBucket: 'mytimetrade-8ef71.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCc5GP2igMXD1URg0rh4ppbFkVoP5kTjJc',
    appId: '1:1012941757457:ios:1e1ec791e1d38f3576e5b0',
    messagingSenderId: '1012941757457',
    projectId: 'mytimetrade-8ef71',
    databaseURL: 'https://mytimetrade-8ef71-default-rtdb.firebaseio.com',
    storageBucket: 'mytimetrade-8ef71.appspot.com',
    iosClientId: '1012941757457-ks1aslaj3onqv9pft4evro2asah7ut7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.mytimetrade',
  );
}
