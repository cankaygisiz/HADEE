import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC9OlcH_WDAwz2iASvADHq4MZHDIpq8ASU",
            authDomain: "ubereatsapp404.firebaseapp.com",
            projectId: "ubereatsapp404",
            storageBucket: "ubereatsapp404.appspot.com",
            messagingSenderId: "1031481640871",
            appId: "1:1031481640871:web:1487f18b3b5255be825882"));
  } else {
    await Firebase.initializeApp();
  }
}
