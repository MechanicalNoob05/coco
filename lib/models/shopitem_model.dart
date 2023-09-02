class Photos {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final bool available;
  Photos(
      {required this.id,
      required this.title,
      required this.url,
      required this.available,
      required this.albumId});
}
