import '../model/song_data.dart';
import '../provider/database_provider.dart';

class SongRepository {
  final DatabaseProvider provider;

  SongRepository({required this.provider});

  Stream<List<SongData>> songsStream() {
    return provider.songsStream();
  }
}
