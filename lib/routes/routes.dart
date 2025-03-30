import 'package:flutter/material.dart';
import 'package:my_profile/Comments/page/comments_page.dart';
import 'package:my_profile/Discover/page/discover_page.dart';
import 'package:my_profile/Home/page/home_page.dart';
import 'package:my_profile/detail/page/detail_page.dart';
import 'package:my_profile/news/page/news_page.dart';
//import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/login/page/login_page.dart';
import 'package:my_profile/profile/page/profile_page.dart';
import 'package:my_profile/settings/pages/settings_page.dart';
import 'package:my_profile/weather/page/weather_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => HomePage(),
    "/detail": (context) => DetailPage(),
    "/comments": (context) => CommentsPage(),
    "/weather": (context) => WeatherPage(),
    "/profile": (context) => ProfilePage(),
    "/settings": (context) => SettingsPage(),
    "/news": (context) => NewsPage(),
    "/discover": (context) => DiscoverPage(),
  };
}
