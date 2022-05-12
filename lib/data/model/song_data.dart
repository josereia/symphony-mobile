import 'package:cloud_firestore/cloud_firestore.dart';

class SongData {
  late String title;
  late List artists;
  late String album;
  late int duration;

  SongData({
    required this.title,
    required this.artists,
    required this.album,
    required this.duration,
  });

  SongData.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    title = documentSnapshot["title"];
    artists = documentSnapshot["artists"];
    album = documentSnapshot["album"];
    duration = documentSnapshot["duration"];
  }
}
