import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hobo_test/models/user_model.dart';

class FirestoreService {
  UserModel userModel = UserModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  String userName;

  // get current user
  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await _auth.currentUser;
    return currentUser;
  }


  Future<String> getUserName() async {
    //query the user photo
    _db.collection("users")
        .doc(_auth.currentUser.uid)
        .snapshots()
        .listen((event) {
      userName = event.get("username");
      print(userName);
      if (userName != null) {
        return userName;
      }
    });

    return userName;
  }



  // get authenticate
  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await _db
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();

    // for the firs registration
    final List<QueryDocumentSnapshot> docs = result.docs;
    return docs.length == 0 ? true : false;
  }

  // update data
  Future<void> updateUser(User currentUser) {
    userModel = UserModel(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
    );

    return _db
        .collection("users")
        .doc(currentUser.uid)
        .update(userModel.toMap())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // Register User
  Future<void> registerUser(name, username, email, password) async {
    UserCredential userCredentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _db
        .collection('users')
        .doc(userCredentials.user.uid)
        .set({
      'uid': userCredentials.user.uid,
      'email': email,
      'name': name,
      'profilePic': null,
      'username': username,
      'guide': false,
      'timeCreation': Timestamp.now()
    });

    userModel = UserModel(
      uid: userCredentials.user.uid,
      email: email,
      name: name,
    );

    print(userModel.uid);
    print(userModel.name);
    userName = userModel.name;

    print(userName);

  }

  // ------------ todo: delete the functions down here -------------------------

//Get Entries
  Stream<List<UserModel>> getAllUsers() {
    return _db.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
  }

//Upsert
  Future<void> setUser(UserModel user) {
    var options = SetOptions(merge: true);

    return _db.collection('users').doc(user.uid).set(user.toMap(), options);
  }

//Delete
  Future<void> removeUser(String userId) {
    return _db.collection('users').doc(userId).delete();
  }
}
