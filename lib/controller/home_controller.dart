import 'package:get/get.dart';
import 'package:symphony/data/repository/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository repository;

  HomeController({required this.repository});

  void logOut() {
    repository.logOut();
  }
}
