import 'package:flutter/material.dart';
//import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';

import 'package:my_profile/routes/routes.dart';
//import 'package:my_profile/weather/page/weather_page.dart';
//import 'package:my_profile/Discover/page/discover_page.dart';

//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/Discover/page/discover_page.dart';
//import 'package:my_profile/Home/page/home_page.dart';

//import 'package:my_profile/home/page/home_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/home/page/home_page.dart';

//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/Discover/page/discover_page.dart';
//import 'package:my_profile/home/page/home_page.dart';

//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';

void main() {
  runApp(Flutterweatherapp());
}

class Flutterweatherapp extends StatelessWidget {
  const Flutterweatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: AppRoutes.routes,
    );
  }
}
