import 'package:get/get.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/repository/album_page_repository.dart';

class AlbumPageController extends GetxController {
  final AlbumPageRepository repository;

  AlbumPageController({required this.repository});

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return await repository.getAlbumSongs(album);
  }
}
