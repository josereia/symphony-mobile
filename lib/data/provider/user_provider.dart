import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:symphony/data/model/user_model.dart';

class UserProvider {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _databaseInstance = FirebaseFirestore.instance;

  UserProvider() {
    _databaseInstance.settings = const Settings(persistenceEnabled: true);
  }

  UserModel? getCurrentUser() {
    if (_authInstance.currentUser != null) {
      return UserModel.fromFirebaseUser(user: _authInstance.currentUser!);
    }

    return null;
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    final Map<String, dynamic> data = {};

    data.addIf(user.name != null, "displayName", user.name);

    if (data.isNotEmpty) {
      await userInstance.updateDisplayName(data["displayName"]);
    }
  }
}
