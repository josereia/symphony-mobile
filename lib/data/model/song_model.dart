class SongModel {
  final String id;
  final String title;
  final Duration duration;
  final String author;
  final Uri audio;
  final Uri video;
  final Uri thumbnail;

  SongModel({
    required this.id,
    required this.audio,
    required this.video,
    required this.author,
    required this.title,
    required this.duration,
    required this.thumbnail,
  });
}
