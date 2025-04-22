import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/firebase_options.dart';
import 'package:my_profile/notification/push_notification_service.dart';
//import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';

import 'package:my_profile/routes/routes.dart';
//import 'package:my_profile/weather/page/weather_page.dart';
//import 'package:my_profile/Discover/page/discover_page.dart';

//import 'package:my_profile/home/page/home_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/home/page/home_page.dart';

//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/Discover/page/discover_page.dart';
//import 'package:my_profile/home/page/home_page.dart';

//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/profile/page/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  await PushNotificationService().requestNotificationPermission();
  await PushNotificationService().initialize();
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
