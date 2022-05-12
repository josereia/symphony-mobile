class ApiProvider {
  String getSongURL(String song, String artist) {
    return "https://res.cloudinary.com/joaosereia/video/upload/v1646144544/$song-$artist.mp3";
  }

  String getAlbumPicURL(String album) {
    return "https://res.cloudinary.com/joaosereia/image/upload/v1646315355/albums/$album.jpg";
  }

  String getArtistPicURL(String artist) {
    return "https://res.cloudinary.com/joaosereia/image/upload/v1646147011/profile_images/$artist.jpg";
  }
}
