import 'package:symphony/data/model/song_model.dart';

class PlaylistModel {
  final String title;
  final List<SongModel> songs;

  PlaylistModel({required this.title, required this.songs});
}
