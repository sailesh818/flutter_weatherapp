import 'package:flutter/material.dart';
import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/home/widget/homepage_widget.dart';
import 'package:my_profile/profile/widget/profilie_widget.dart';
import 'package:my_profile/weather/widget/weather_widget.dart';
//import 'package:my_profile/Home/page/home_page.dart';
//import 'package:my_profile/profile/widget/profilie_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<WeatherForecastItem> profileData = [
    WeatherForecastItem(weather: "Favourite", icon: Icons.favorite),
    WeatherForecastItem(
      weather: "Subscription",
      icon: Icons.subscriptions_rounded,
    ),
    WeatherForecastItem(weather: "Downloads", icon: Icons.download),
    WeatherForecastItem(weather: "Locations", icon: Icons.location_city),
    WeatherForecastItem(weather: "Display", icon: Icons.smart_display),
    WeatherForecastItem(weather: "Languages", icon: Icons.language),
    WeatherForecastItem(weather: "Feed Preferance", icon: Icons.feed),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },

          child: Icon(Icons.arrow_back),
        ),
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    image: DecorationImage(
                      image: AssetImage('assets/one.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Mr. Flower Rosey',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Student of news department',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          ListView.separated(
            separatorBuilder: (context, index) {
              return Column(children: [Divider(), SizedBox(height: 20)]);
            },

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: profileData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/discover',
                    arguments: profileData[index].weather,
                  );
                },
                child: ProfileWidget(
                  icon: profileData[index].icon,
                  weather: profileData[index].weather,
                  prefixIcon: Icons.arrow_right,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
