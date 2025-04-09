import 'dart:convert';

List<ArticleProperty> articlePropertyFromJson(String str) =>
    List<ArticleProperty>.from(
      json.decode(str).map((x) => ArticleProperty.fromJson(x)),
    );

String articlePropertyToJson(List<ArticleProperty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleProperty {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  ArticleProperty({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleProperty.fromJson(Map<String, dynamic> json) =>
      ArticleProperty(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  dynamic id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}



// class NewsWidget extends StatelessWidget{
  //   const NewsWidget({
  //     super.key,
  //   });

  //   final String image;
  //   final String publishedAt;
  //   final String title;
  //   final String description;
  // }