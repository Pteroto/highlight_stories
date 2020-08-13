class Urls {
  final List<String> videos = ["canal-brasil", "gnt"];
  final String baseUrl1 =
      "https://firebasestorage.googleapis.com/v0/b/highlightstories-37942.appspot.com/o/";
  final String baseUrl2 =
      ".mp4?alt=media&token=6b5c59a7-a4f4-4a0d-84c3-d849c1ad9a2d";

  List<String> getVideos() {
    List<String> finalUrl;
    videos.forEach((element) {
      finalUrl.add(baseUrl1 + element + baseUrl2);
    });

    return finalUrl;
  }
}
