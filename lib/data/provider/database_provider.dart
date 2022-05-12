import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:symphony/data/model/song_data.dart';

class DatabaseProvider {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<SongData>> songsStream() {
    return firebaseFirestore
        .collection("songs")
        .snapshots()
        .map((QuerySnapshot query) {
      List<SongData> songsList = [];
      for (var song in query.docs) {
        final songModel = SongData.fromDocumentSnapshot(documentSnapshot: song);
        songsList.add(songModel);
      }

      return songsList;
    });
  }
}
