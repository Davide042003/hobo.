import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hobo_test/models/user_model.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

//Get Entries
  Stream<List<User>> getEntries() {
    return _db
        .collection('users')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) => User.fromJson(doc.data()))
            .toList());
  }

//Upsert
  Future<void> setEntry(User user) {
    var options = SetOptions(merge: true);

    return _db
        .collection('users')
        .doc()
        .set(user.toMap(), options);
  }

//Delete
  Future<void> removeEntry(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .delete();
  }
}
