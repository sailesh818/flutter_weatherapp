// ignore: unused_import
import 'dart:convert';

class NewsDataModel {
  final String title;
  final String description;
  final String image;
  final String publishertime;
  final String author;
  final int activeusers;

  NewsDataModel({
    required this.title,
    required this.description,
    required this.image,
    required this.publishertime,
    required this.author,
    required this.activeusers,
  });

  static NewsDataModel fromJson(Map<String, dynamic> json) {
    return NewsDataModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      publishertime: json['publishertime'] ?? '',
      author: json['author'] ?? '',
      activeusers: json['activeusers'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'publishertime': publishertime,
      'author': author,
      'activeusers': activeusers,
    };
  }
}
