class Urls {
  final List<String> videos = ["canal-brasil", "gnt", "gloob", "globonews", "multishow", "canal-off", "studio-universal", "viva"];
  final String baseUrl1 =
      "https://firebasestorage.googleapis.com/v0/b/highlightstories-37942.appspot.com/o/stories%2F";
  final String baseUrl2 =
      ".mp4?alt=media&token=db83b9a3-7f90-4ff4-a464-187224728b2e";

  List<String> getVideos() {
    List<String> finalUrl = [];
    videos.forEach((element) {
      finalUrl.add(baseUrl1 + element + baseUrl2);
    });

    return finalUrl;
  }
}
