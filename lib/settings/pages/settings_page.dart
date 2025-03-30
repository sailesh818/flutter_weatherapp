import 'package:flutter/material.dart';
import 'package:my_profile/profile/widget/profilie_widget.dart';
import 'package:my_profile/weather/widget/weather_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
      appBar: AppBar(title: Text("Settings")),
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
                      image: AssetImage('assets/four.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Mr. Michael Faraday',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'info@michaelfaraday.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign Out',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 153, 12, 12),
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
