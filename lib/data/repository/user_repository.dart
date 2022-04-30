import 'package:symphony/data/provider/auth_provider.dart';

class UserRepository {
  final AuthProvider provider;

  UserRepository({required this.provider});

  void loginWithEmailAndPass(email, password) {
    provider.loginWithEmailAndPass(email, password);
  }

  void loginWithGoogle() {
    provider.loginWithGoogle();
  }

  void loginWithApple() {}

  void logOut() {
    provider.logOut();
  }
}
