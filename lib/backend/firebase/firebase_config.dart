import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDu0jx3Uxl9MM7NoFAe5e4ZHPwI9N8qTHc",
            authDomain: "pacemaker-data-platform.firebaseapp.com",
            projectId: "pacemaker-data-platform",
            storageBucket: "pacemaker-data-platform.appspot.com",
            messagingSenderId: "825775316217",
            appId: "1:825775316217:web:a59d13f05eff358ff89628",
            measurementId: "G-5SS4N4BL80"));
  } else {
    await Firebase.initializeApp();
  }
}
