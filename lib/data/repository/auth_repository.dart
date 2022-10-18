import 'package:symphony/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository({required this.provider});

  Future<void> loginWithEmailAndPass(String email, String password) async {
    await provider.loginWithEmailAndPass(email, password);
  }

  Future<void> loginWithGoogle() async {
    await provider.loginWithGoogle();
  }

  Future<void> registerWithEmailAndPassword(
    String username,
    String email,
    String password,
    String b64ProfilePic,
  ) async {
    await provider.registerWithEmailAndPassword(
      username,
      email,
      password,
      b64ProfilePic,
    );
  }

  Future<void> loginWithApple() async {}

  Future<void> logOut() async {
    await provider.logOut();
  }
}
