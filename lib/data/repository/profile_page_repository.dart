import 'package:symphony/data/model/user_model.dart';
import 'package:symphony/data/provider/user_provider.dart';

class ProfilePageRepository {
  final UserProvider userProvider;

  ProfilePageRepository({
    required this.userProvider,
  });

  UserModel? getCurrentUser() {
    return userProvider.getCurrentUser();
  }
}
