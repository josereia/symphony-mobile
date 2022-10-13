import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/provider/user_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  final UserProvider userProvider;

  AuthRepository({required this.provider, required this.userProvider});

  void register() {
    provider.register();
  }

  void loginWithEmailAndPass(String email, String password) {
    provider.loginWithEmailAndPass(email, password);
  }

  void loginWithGoogle() {
    provider.loginWithGoogle();
  }

  void registerWithEmailAndPassword(
      String email, String password, String b64ProfilePic) {
    provider.registerWithEmailAndPassword(email, password, b64ProfilePic);
  }

  void loginWithApple() {}

  void logOut() {
    provider.logOut();
  }
}
