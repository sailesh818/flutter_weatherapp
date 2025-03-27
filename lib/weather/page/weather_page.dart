import 'package:flutter/material.dart';
import 'package:my_profile/weather/widget/weather_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, this.title, this.listData});
  final String? title;
  final List? listData;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    //print(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    //final data = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('9:21', style: TextStyle(fontSize: 30, color: Colors.white)),

            Text('Sunny', style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'New York',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  Icon(Icons.location_on, color: Colors.white, size: 30),
                  Icon(Icons.arrow_drop_down, color: Colors.white, size: 30),
                ],
              ),
              Icon(Icons.settings, color: Colors.white, size: 30),
            ],
          ),
          SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    color: Colors.blue,

                    child: Text(
                      '22'.toUpperCase(),
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  Icon(Icons.circle_outlined, color: Colors.white),
                ],
              ),

              Text(
                ' Sunny 22/14',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 120),
          Center(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.yellowAccent,
              size: 200, // Adjust size as needed
            ),
          ),
          SizedBox(height: 50), // Space between the sunny icon and the columns
          // Bottom Part: Three Columns
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WeatherForecastItem(
                weather: widget.title,
                icon: Icons.wb_sunny,
                prefix: "12:23",
              ),
              WeatherForecastItem(
                weather: "Monday",
                icon: Icons.cloudy_snowing,
                prefix: "13:24",
              ),
              WeatherForecastItem(
                weather: "Thursday",
                icon: Icons.wb_cloudy,
                prefix: "34:24",
              ),
              // First Column with Text and Icon
              // Second Column with Text and Icon

              // Third Column with Text and Icon
            ],
          ),
        ],
      ),
    );
  }
}
