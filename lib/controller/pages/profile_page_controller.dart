import 'package:get/get.dart';
import 'package:symphony/data/model/user_model.dart';
import 'package:symphony/data/repository/profile_page_repository.dart';

class ProfileController extends GetxController {
  final ProfilePageRepository repository;

  final Rx<UserModel?> _user = Rx(null);

  UserModel? get getUser => _user.value;

  ProfileController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    _user.value = repository.getCurrentUser();
  }
}
