import 'package:get/get.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/repository/home_page_repository.dart';

class HomeController extends GetxController {
  final HomePageRepository repository;
  Rx<List<SongModel>> songsList = Rx<List<SongModel>>([]);

  List<SongModel> get songs => songsList.value;

  HomeController({required this.repository});

  @override
  void onInit() {
    songsList.bindStream(repository.songsStream());
    super.onInit();
  }

  void logOut() {
    repository.logOut();
  }
}
