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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCYoYIJSWsL5-zQBJTXPlOMBP9DTasShYw',
    appId: '1:608066092330:web:bcaac7bc5519657b583253',
    messagingSenderId: '608066092330',
    projectId: 'todoapp-e9013',
    authDomain: 'todoapp-e9013.firebaseapp.com',
    storageBucket: 'todoapp-e9013.appspot.com',
    measurementId: 'G-474PFFGFXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqTO0FCv9TT0UXdTtGapT9HOct6Xva0Dk',
    appId: '1:608066092330:android:c79fbcd221f4f611583253',
    messagingSenderId: '608066092330',
    projectId: 'todoapp-e9013',
    storageBucket: 'todoapp-e9013.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATaPEhuM7WrvfAhFHH_KNN1GEgpcqrqfo',
    appId: '1:608066092330:ios:4704a4cdf8a24d2b583253',
    messagingSenderId: '608066092330',
    projectId: 'todoapp-e9013',
    storageBucket: 'todoapp-e9013.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATaPEhuM7WrvfAhFHH_KNN1GEgpcqrqfo',
    appId: '1:608066092330:ios:4704a4cdf8a24d2b583253',
    messagingSenderId: '608066092330',
    projectId: 'todoapp-e9013',
    storageBucket: 'todoapp-e9013.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCYoYIJSWsL5-zQBJTXPlOMBP9DTasShYw',
    appId: '1:608066092330:web:9cad6eab69d481d1583253',
    messagingSenderId: '608066092330',
    projectId: 'todoapp-e9013',
    authDomain: 'todoapp-e9013.firebaseapp.com',
    storageBucket: 'todoapp-e9013.appspot.com',
    measurementId: 'G-W4NRHH16CQ',
  );
}
