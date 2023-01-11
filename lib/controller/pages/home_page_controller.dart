import 'package:get/get.dart';
import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/repository/home_page_repository.dart';

class HomeController extends GetxController {
  final HomePageRepository repository;

  final Rx<List<PlaylistModel>?> _playlists = Rx<List<PlaylistModel>?>(null);

  List<PlaylistModel>? get songs => _playlists.value;

  HomeController({required this.repository});

  @override
  Future<void> onInit() async {
    super.onInit();

    final playlist = await repository.getPlaylists();

    if (playlist != null) {
      _playlists.value = [];
      _playlists.value?.add(playlist);
      _playlists.refresh();
    }
  }
}
