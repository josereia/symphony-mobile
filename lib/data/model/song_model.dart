class SongModel {
  final String id;
  final String title;
  final Duration duration;
  final String author;
  final Uri url;
  final Uri thumbnail;

  SongModel({
    required this.id,
    required this.url,
    required this.author,
    required this.title,
    required this.duration,
    required this.thumbnail,
  });
}
