import 'package:get/get.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/model/user_model.dart';
import 'package:symphony/data/repository/home_page_repository.dart';

class ProfileController extends GetxController {
  final HomePageRepository repository;

  final Rx<UserModel?> _user = Rx(null);
  Rx<List<SongModel>> songsList = Rx<List<SongModel>>([]);

  List<SongModel> get songs => songsList.value;
  UserModel? get getUser => _user.value;

  ProfileController({required this.repository});

  @override
  void onInit() {
    _user.value = repository.getCurrentUser();

    songsList.bindStream(repository.songsStream());
    super.onInit();
  }
}
