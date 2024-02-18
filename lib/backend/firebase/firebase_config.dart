import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBN5OR5m9GxP8GTVsXKmNVyWTtyaqy5KjE",
            authDomain: "photun-8b9a7.firebaseapp.com",
            projectId: "photun-8b9a7",
            storageBucket: "photun-8b9a7.appspot.com",
            messagingSenderId: "632332478928",
            appId: "1:632332478928:web:a917f1fb77b9efbb23b1d5",
            measurementId: "G-98CW0Q34LM"));
  } else {
    await Firebase.initializeApp();
  }
}
