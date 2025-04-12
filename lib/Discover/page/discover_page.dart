import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_profile/database/database_service.dart';

class ArticleProperty {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  ArticleProperty({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory ArticleProperty.fromJson(Map<String, dynamic> json) =>
      ArticleProperty(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "Unknown",
        title: json["title"] ?? "No Title",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"],
        publishedAt:
            json["publishedAt"] != null
                ? DateTime.parse(json["publishedAt"])
                : DateTime.now(),
        content: json["content"],
      );

  Map<String, dynamic> toDbMap() => {
    DatabaseService.title: title,
    DatabaseService.author: author ?? "",
    DatabaseService.description: description,
    DatabaseService.url: url,
  };
}

class Source {
  dynamic id;
  String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json["id"], name: json["name"] ?? "No Source");
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<ArticleProperty> articles = [];
  List<Map<String, dynamic>> storedArticles = [];
  String? title;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchArticles();
    getTitle();
    loadStoredArticles();
  }

  Future<void> fetchArticles() async {
    const url =
        'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<ArticleProperty> loadedArticles =
            (data['articles'] as List)
                .map((json) => ArticleProperty.fromJson(json))
                .toList();

        if (loadedArticles.isNotEmpty) {
          //await DatabaseService().insertArticle(loadedArticles[0].toDbMap());
          for (final article in loadedArticles.take(5)) {
            await DatabaseService().insertArticle(article.toDbMap());
          }
          await loadStoredArticles();
        }

        setState(() {
          articles = loadedArticles;
          isLoading = false;
        });
      } else {
        print("Failed to load articles: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching articles: $e");
    }
  }

  Future<void> loadStoredArticles() async {
    try {
      final stored = await DatabaseService().fetchStoredArticles();
      setState(() {
        storedArticles = stored;
      });
    } catch (e) {
      print("Error loading stored articles: $e");
    }
  }

  Future<void> saveTitle(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("title", value);
    getTitle();
  }

  void getTitle() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      title = prefs.getString("title");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 1, 30),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 7, 1, 30),
        actions: const [
          Icon(Icons.notifications, size: 30, color: Colors.white),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/one.jpg'),
          ),
          SizedBox(width: 10),
        ],
        title: const Text(
          'Discover Page',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (articles.isNotEmpty) {
                            saveTitle(articles[0].title);
                          }
                        },
                        child: const Text(
                          'Most Read',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        title ?? "N/A",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'See more',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ...articles
                      .take(5)
                      .map(
                        (article) => NewsWidget(
                          image: article.urlToImage ?? 'assets/one.jpg',
                          publishedAt:
                              article.publishedAt.toLocal().toString().split(
                                ".",
                              )[0],
                          title: article.title,
                          description: article.description,
                          showSave: true,
                          onSave: () async {
                            await DatabaseService().insertArticle(
                              article.toDbMap(),
                            );
                            await loadStoredArticles();
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Article saved for offline viewing",
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                  const SizedBox(height: 20),

                  const Text(
                    "Stored Articles",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Divider(color: Colors.white30),

                  if (storedArticles.isEmpty)
                    const Text(
                      "No articles saved locally.",
                      style: TextStyle(color: Colors.white70),
                    )
                  else
                    ...storedArticles.map(
                      (article) => NewsWidget(
                        image: 'assets/one.jpg',
                        publishedAt: 'Saved Locally',
                        title: article[DatabaseService.title],
                        description: article[DatabaseService.description],
                      ),
                    ),
                ],
              ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.image,
    required this.publishedAt,
    required this.title,
    required this.description,
    this.onSave,
    this.showSave = false,
  });

  final String image;
  final String publishedAt;
  final String title;
  final String description;
  final VoidCallback? onSave;
  final bool showSave;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child:
              image.startsWith('http')
                  ? Image.network(
                    image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Image.asset(
                          'assets/one.jpg',
                          width: 60,
                          height: 60,
                        ),
                  )
                  : Image.asset(image, width: 60, height: 60),
        ),
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              "Published: $publishedAt",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        trailing:
            showSave
                ? IconButton(
                  icon: const Icon(Icons.bookmark_add, color: Colors.white),
                  onPressed: onSave,
                )
                : null,
      ),
    );
  }
}
