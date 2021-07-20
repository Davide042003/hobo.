import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hobo_test/models/user_model.dart';
import 'package:uuid/uuid.dart';

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
    // generate random referral code
    var referralCode = DateTime.now().millisecondsSinceEpoch.toString();
    var uuid = Uuid();
    //var referralCode = uuid.v1();
    print("Referral Code: $referralCode");

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
      'referralCode': referralCode,
      'ratings': 0,
      'totalRatings': 0,
      'revenue': 0.0,
      'followers': 0,
      'followed': 0,
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

   Future<User> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      var referralCode = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      var uuid = Uuid();
      //var referralCode = uuid.v1();
      print("Referral Code: $referralCode");

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }


      _db
          .collection('users')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'email': googleSignInAccount.email,
        'name': googleSignInAccount.displayName,
        'profilePic': null,
        'username': googleSignInAccount.email.substring(0, googleSignInAccount.email.indexOf('@')),
        'guide': false,
        'referralCode': referralCode,
        'ratings': 0,
        'totalRatings': 0,
        'revenue': 0.0,
        'followers': 0,
        'followed': 0,
        'timeCreation': Timestamp.now()
      });

      userModel = UserModel(
        uid: user.uid,
        email: googleSignInAccount.email,
        name: googleSignInAccount.displayName,
      );


      print(userModel.uid);
      print(userModel.name);
      userName = userModel.name;

      print(userName);

    }

    return user;
  }

  // Create Tours
  Future<void> createTours(userId, tourId, tourName, tourPlace,tourNumberOfPeople,tourIsForChildren, tourIsPrivate,tourDescription, tourLanguage, tourImage, tourDate,tourTimeStart, tourTimeEnd, tourActivitiesId, tourActivitiesVehiclesId, tourRatings, tourTotalRatings, tourPrice) async {

    _db
        .collection('users')
        .doc(userId)
        .collection('tours')
        .doc(tourId)
        .set({
      // step 1
      'userId': userId,
      'tourId': tourId,
      'tourName': tourName,
      'tourPlace': tourPlace,
      'tourNumberOfPeople': tourNumberOfPeople,
      'tourIsForChildren': tourIsForChildren,
      'tourIsPrivate': tourIsPrivate,
      // step 2
      'tourImage': tourImage,
      'tourDescription': tourDescription,
      'tourLanguage': tourLanguage,
      //step 3
      'tourDate': tourDate,
      'tourTimeStart': tourTimeStart,
      'tourTimeEnd': tourTimeEnd,
      // step 4
      'tourActivitiesId': tourActivitiesId,
      // step5
      'tourActivitiesVehiclesId': tourActivitiesVehiclesId,

      'tourTotalRatings': tourTotalRatings,
      'tourRatings': tourRatings,
      'tourPrice': tourPrice,
      'timeCreation': Timestamp.now()
    });

    print('Success: Tour Created!');

  }

  // Create Tour step by step
  Future<void> createToursStep1(userId, tourId, tourName, tourPlace,tourNumberOfPeople,tourIsForChildren, tourIsPrivate) async {

    _db
        .collection('users')
        .doc(userId)
        .collection('tours')
        .doc(tourId)
        .set({
      // step 1
      'userId': userId,
      'tourId': tourId,
      'tourName': tourName,
      'tourPlace': tourPlace,
      'tourNumberOfPeople': tourNumberOfPeople,
      'tourIsForChildren': tourIsForChildren,
      'tourIsPrivate': tourIsPrivate,
      'timeCreation': Timestamp.now()
    });

    print('Success: Tour Created!');

  }
  
  // ---

  // create sub-collection: tour -> images
  Future<void> addTourImage(userId, tourId, imageUrl) async {
    // generate random tourId
    var uuid = Uuid();
    var imageId = uuid.v1();

    _db
        .collection('users')
        .doc(userId)
        .collection('tours')
        .doc(tourId).collection('images').doc(imageId)
        .set({
      // step 1
      'userId': userId,
      'tourId': tourId,
      'imageId': imageId,
      'imageUrl': imageUrl,
      'timeCreation': Timestamp.now()
    });

    print('Success: Image Added!');

  }

  // create activity
  Future<void> createActivity(userId, tourId, activityId, description, only18, luxury, activitiesPlacesId, price) async {

    _db
        .collection('users')
        .doc(userId)
        .collection('tours')
        .doc(tourId).collection('activities').doc(activityId)
        .set({
      // step 1
      'userId': userId,
      'tourId': tourId,
      'activityId': activityId,
      'description': description,
      'only18': only18,
      'luxury': luxury,
      'activitiesPlacesId': activitiesPlacesId,
      'price': price,
      'timeCreation': Timestamp.now()
    });

    print('Success: Activity Created!');

  }

  // step 5 -> create collection -> doc
  Future<void> createVehicleInfo(userId, tourId, vehicleId, numberOfPeopleVehicle, priceVehicle) async {

    _db
        .collection('users')
        .doc(userId)
        .collection('tours')
        .doc(tourId).collection('vehicles').doc(vehicleId)
        .set({
      // step 1
      'userId': userId,
      'tourId': tourId,
      'vehicleId': vehicleId,
      'numberOfPeopleVehicle': numberOfPeopleVehicle,
      'priceVehicle': priceVehicle,
      'timeCreation': Timestamp.now()
    });

    print('Success: Vehicle Info Created!');

  }

  // Create Tours
  Future<void> createPosts(userId, postName, postLocalization, postImage, postLikes, postDescription, postComments) async {
    // generate random tourId
    var uuid = Uuid();
    var postId = uuid.v1();

    _db
        .collection('users')
        .doc(userId)
        .collection('posts')
        .doc(postId)
        .set({
      'userId': userId,
      'postId': postId,
      'postName': postName,
      'postLocalization': postLocalization,
      'postImage': postImage,
      'postLikes': postLikes,
      'postDescription': postDescription,
      'postComments': postComments,
      'timeCreation': Timestamp.now()
    });

    print('Success: Post Created!');

  }

  // Create Review
  Future<void> createReviews(userIdGuide, usernameGuide, userIdTourist, usernameTourist, tourId, ratings, date, description) async {
    // generate random tourId
    var uuid = Uuid();
    var reviewId = uuid.v1();

    _db
        .collection('users')
        .doc(userIdGuide)
        .collection('reviews')
        .doc(reviewId)
        .set({
      'userIdGuide': userIdGuide,
      'usernameGuide': usernameGuide,
      'userIdTourist': userIdTourist,
      'usernameTourist': usernameTourist,
      'tourId': tourId,
      'ratings': ratings,
      'date': date,
      'description': description,
      'timeCreation': Timestamp.now()
    });

    print('Success: Review Created!');

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
