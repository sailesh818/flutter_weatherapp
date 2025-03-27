class NewsDataModel {
  String title;
  String description;
  String image;
  String publishertime;
  String author;
  int? activeusers;

  NewsDataModel({
    required this.title,
    required this.description,
    required this.image,
    required this.publishertime,
    required this.author,
    this.activeusers,
  });
  // ignore: empty_constructor_bodies
}
