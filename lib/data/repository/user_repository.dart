import 'package:firebase_auth/firebase_auth.dart';
import 'package:symphony/data/model/user_model.dart';
import 'package:symphony/data/provider/user_provider.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository(this.provider);

  UserModel? getCurrentUser() {
    return provider.getCurrentUser();
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    return await provider.updateUser(userInstance, user);
  }
}
