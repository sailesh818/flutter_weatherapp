import 'package:flutter/material.dart';
import 'package:my_profile/Comments/page/comments_page.dart';
import 'package:my_profile/Discover/page/discover_page.dart';
import 'package:my_profile/gallery/pages/gallery_page.dart';
import 'package:my_profile/login/page/login_page.dart';
import 'package:my_profile/news/page/news_page.dart';
//import 'package:my_profile/weather/page/weather_page.dart';
import 'package:my_profile/profile/page/profile_page.dart';
import 'package:my_profile/settings/pages/settings_page.dart';
import 'package:my_profile/weather/page/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = ['23'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              WeatherPage(title: "qwertyert", listData: data),
                      settings: RouteSettings(arguments: "data"),
                    ),
                  );
                },
                child: Text('Weatherpage'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GalleryPage()),
                  );
                },
                child: Text('Gallery'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentsPage()),
                  );
                },
                child: Text('Comments'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Text('Settings'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsPage()),
                  );
                },
                child: Text('News'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text('Profile'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiscoverPage()),
                  );
                },
                child: Text('Discover'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
