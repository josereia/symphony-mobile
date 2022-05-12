import 'package:get/get.dart';

import '../data/model/song_data.dart';
import '../data/repository/song_repository.dart';

class SongController extends GetxController {
  final SongRepository repository;
  Rx<List<SongData>> songsList = Rx<List<SongData>>([]);

  SongController({required this.repository});

  List<SongData> get songs => songsList.value;

  @override
  void onInit() {
    songsList.bindStream(repository.songsStream());
    super.onInit();
  }
}
