import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hobo_test/models/user_model.dart';


class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // get current user
  Future<User> getCurrentUser () async {
    User currentUser;
    currentUser = await _auth.currentUser;
    return currentUser;
  }

  // Register User
  Future<void> registerUser (name, username, email, password) async{
    UserCredential userCredentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseFirestore.instance.collection('users').doc(userCredentials.user.uid).set({
      'uid': userCredentials.user.uid,
      'email': email,
      'name': name,
      'profilePic': null,
      'username': username,
      'guide': false,
      'timeCreation' : Timestamp.now()
    });
  }

//Get Entries
  Stream<List<UserModel>> getAllUsers() {
    return _db
        .collection('users')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
  }



//Upsert
  Future<void> setUser(UserModel user) {
    var options = SetOptions(merge: true);

    return _db
        .collection('users')
        .doc(user.uid)
        .set(user.toMap(), options);
  }


//Delete
  Future<void> removeUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .delete();
  }
}
