import 'package:flutter/material.dart';
import 'package:my_profile/Discover/page/discover_page.dart';
import 'package:my_profile/Home/page/home_page.dart';
import 'package:my_profile/detail/page/detail_page.dart';
//import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/login/page/login_page.dart';
import 'package:my_profile/profile/page/profile_page.dart';
import 'package:my_profile/weather/page/weather_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => HomePage(),
    "/detail": (context) => DetailPage(),
    "/weather": (context) => WeatherPage(),
    "/profile": (context) => ProfilePage(),
    "/discover": (context) => DiscoverPage(),
  };
}
