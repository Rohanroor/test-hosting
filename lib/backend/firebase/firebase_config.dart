import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCy2ryYvIlqF_QjbcvEk9gSnkbXkipG1iE",
            authDomain: "hoody-sfwztt.firebaseapp.com",
            projectId: "hoody-sfwztt",
            storageBucket: "hoody-sfwztt.appspot.com",
            messagingSenderId: "223788242358",
            appId: "1:223788242358:web:2641c895172f07534fdd17"));
  } else {
    await Firebase.initializeApp();
  }
}
