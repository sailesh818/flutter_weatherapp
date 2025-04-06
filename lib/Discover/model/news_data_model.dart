class NewsDataModel {
  String title;
  String description;
  String image;
  String publishertime;
  String author;
  int? activeusers;
  int? userId;
  int? id;

  NewsDataModel({
    required this.title,
    required this.description,
    required this.image,
    required this.publishertime,
    required this.author,
    this.activeusers,
    this.userId,
    this.id,
  });
  factory NewsDataModel.fromJson(Map<String, dynamic> json) {
    return NewsDataModel(
      title: json['title'],
      description: 'sdfg',
      image: 'assets/one.jpg',
      publishertime: 'afdfgh',
      author: 'aoih',
    );
  }
}
