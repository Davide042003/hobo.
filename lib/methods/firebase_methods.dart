import 'package:firebase_core/firebase_core.dart';

class FirebaseMethods {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
