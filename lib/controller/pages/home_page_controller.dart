import 'package:get/get.dart';
import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/repository/home_page_repository.dart';

class HomeController extends GetxController {
  final HomePageRepository repository;

  final Rx<List<PlaylistModel>?> _playlists = Rx<List<PlaylistModel>?>(null);

  List<PlaylistModel?>? get getPlaylists => _playlists.value;

  HomeController({required this.repository});

  @override
  Future<void> onInit() async {
    super.onInit();

    final pop = await repository.getPlaylist(
      id: "RDCLAK5uy_lBNUteBRencHzKelu5iDHwLF6mYqjL-JU",
    );

    final hits = await repository.getPlaylist(
      id: "PLKl-ToKj7DF7Bl7DqSmT5bSpAuVWsBV0l",
    );

    final gloria = await repository.getPlaylist(
      id: "PLG6AqQXCmJshDSakKs2wjWrBjHE2CNBTk",
    );

    final videos = await repository.getPlaylist(
      id: "PLQzS_iW5Z0TXbu7OUu2IIy8VJozdVnwVI",
    );

    if (pop != null || hits != null) {
      _playlists.value = [];
    }

    if (pop != null) {
      _playlists.value?.add(pop);
      _playlists.refresh();
    }

    if (hits != null) {
      _playlists.value?.add(hits);
      _playlists.refresh();
    }

    if (gloria != null) {
      _playlists.value?.add(gloria);
      _playlists.refresh();
    }

    if (videos != null) {
      _playlists.value?.add(videos);
      _playlists.refresh();
    }
  }
}
