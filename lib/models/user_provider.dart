import 'package:hobo_test/methods/firestore_service.dart';
import 'package:hobo_test/models/user_model.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:uuid/uuid.dart';


class UserProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _userName;
  String _userId;
  var uuid = Uuid();

  // Getters
  String get userName => _userName;
  String get userId => _userId;
  Stream<List<UserModel>> get users => firestoreService.getAllUsers();

  // Setters
  set changeUserName (String userName) {
    _userName = userName;
    notifyListeners();
  }

  // Register
  registerUser (UserModel userModel) {
    if (userModel != null){
      _userName = userModel.name;
      _userId = userModel.uid;
      print("Registration... ${userModel.name} ${userModel.uid}");
    }
  }

  loadAll (UserModel userModel) {
    if (userModel != null){
      _userName = userModel.name;
      _userId = userModel.uid;
    } else {
      _userName = null;
      _userId = null;
    }
  }

  saveData () {
    if (_userId == null){
      // add data to model
      var newUser = UserModel(username: _userName, uid: uuid.v1());
      firestoreService.setUser(newUser);
      print ("Save -> create $newUser");
    } else {
      var updateUser = UserModel(username: _userName, uid: _userId);
      firestoreService.setUser(updateUser);
    }
  }
}