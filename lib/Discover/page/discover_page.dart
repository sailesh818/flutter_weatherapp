import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_profile/Discover/model/article_model.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:my_profile/Discover/model/news_data_model.dart';
import 'package:my_profile/Discover/widget/categorylist_widget.dart';
import 'package:my_profile/Discover/widget/explore_wdiget.dart';
import 'package:my_profile/Discover/widget/slider_container_widget.dart';
import 'package:my_profile/database/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int currentIndex = 0;
  List<String> categoryList = [
    "all",
    "sports",
    "Politics",
    "Entertainment",
    "Technology",
    "Science",
    "Education",
  ];

  List<NewsDataModel> sliderlist = [
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/one.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Mbape lottery',
      description: 'He hit the loss',
      image: 'assets/two.jpg',
      publishertime: '19:24',
      author: 'deadly day',
      activeusers: 96,
    ),
    NewsDataModel(
      title: 'Rayane mayane glory at ',
      description: 'He dug the earth out from the universe',
      image: 'assets/three.jpg',
      publishertime: '11:24',
      author: 'walking dead',
      activeusers: 54,
    ),
    NewsDataModel(
      title: 'Calling all the day out',
      description: 'Ucl news has been remebered all',
      image: 'assets/four.jpg',
      publishertime: '6:24',
      author: 'Running nose',
      activeusers: 34,
    ),
    NewsDataModel(
      title: 'Futsal',
      description: 'Its popularity hasbeen growing',
      image: 'assets/five.jpg',
      publishertime: '7:24',
      author: 'daily days',
      activeusers: 995,
    ),
    NewsDataModel(
      title: 'Nobody dares to move',
      description: 'Calling all the day out',
      image: 'assets/six.jpg',
      publishertime: '9:24',
      author: 'calling',
      activeusers: 2378,
    ),
    NewsDataModel(
      title: 'Hoping the new',
      description: 'Its begining to bring the glory',
      image: 'assets/seven.jpg',
      publishertime: '10:24',
      author: 'beam Radioboy',
      activeusers: 903,
    ),
    NewsDataModel(
      title: 'Sunlight',
      description: 'was he the one?',
      image: 'assets/eight.jpg',
      publishertime: '3:24',
      author: 'moonlight Radioboy',
      activeusers: 67,
    ),
    NewsDataModel(
      title: 'moonlight in the dimlight',
      description: 'its beautiful night to begin the day',
      image: 'assets/nine.jpg',
      publishertime: '1:24',
      author: 'happy Radioboy',
      activeusers: 89,
    ),
    NewsDataModel(
      title: 'calling the day',
      description: 'it has been all day out',
      image: 'assets/ten.jpg',
      publishertime: '15:267',
      author: 'Radioboy in husk',
      activeusers: 98,
    ),
  ];

  NewsDataModel? newsDataModel;

  List<Map<String, dynamic>> storedArticles = [
    {
      'id': 1,
      'title': 'Article 1',
      'author': 'Author 1',
      'description': 'This is article 1.',
      'url': 'http://example.com/1',
    },
    {
      'id': 2,
      'title': 'Article 2',
      'author': 'Author 2',
      'description': 'This is article 2.',
      'url': 'http://example.com/2',
    },
  ];

  @override
  void initState() {
    super.initState();
    // fetchAlbumData();
    loadAlbumData();
    loadStoredArticles();
    getTitle();
  }

  Future<void> loadStoredArticles() async {
    final articles = await fetchStoredArticles();
    setState(() {
      storedArticles = articles;
    });
  }

  Future<List<Map<String, dynamic>>> fetchStoredArticles() async {
    final db = await DatabaseService().database;
    return await db.query(DatabaseService.tableName);
  }

  void loadAlbumData() async {
    final data = await fetchAlbumData();
    setState(() {
      newsDataModel = data;
    });
  }

  Future<NewsDataModel?> fetchAlbumData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      );
      print(response);
      if (response.statusCode == 200) {
        return NewsDataModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return null;
  }

  Future<List<ArticleProperty>?> fetchArticleData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://saurav.tech/NewsAPI/top-headlines/category/health/in.json',
        ),
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List<ArticleProperty> articles =
            (jsonResponse['articles'] as List)
                .map((article) => ArticleProperty.fromJson(article))
                .toList();
        return articles;
      }
    } catch (e) {
      throw Exception('Failed to load article data');
    }
    return null;
  }

  Future<void> saveTitle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("title", value);
    getTitle();
  }

  String? title;

  void getTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    title = prefs.getString("title");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 1, 30),
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/one.jpg'),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 7, 1, 30),
        title: const Text(
          'Discover Page',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          CategorylistWidget(),

          const SizedBox(height: 10),
          Text(newsDataModel?.title ?? ""),

          SliderContainerWidget(),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  itemCount: storedArticles.length,
                  itemBuilder: (context, index) {
                    final article = storedArticles[index];
                    return ListTile(
                      title: Text(article['title'] ?? 'No Title'),
                      subtitle: Text(
                        article['description'] ?? 'No Description',
                      ),
                      onTap: () {},
                    );
                  },
                ),

                // const Text(
                //   'See more',
                //   style: TextStyle(
                //     fontSize: 10,
                //     color: Colors.white,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            height: 90,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: sliderlist[index],
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(sliderlist[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 1),
              itemCount: sliderlist.length,
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    saveTitle(newsDataModel?.title ?? "");
                  },
                  child: const Text(
                    'Most Read',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 246, 243, 243),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  title ?? "N/A",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Text(
                  'See more',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 246, 243, 243),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          LastSizedboxWidget(),
        ],
      ),
    );
  }
}
