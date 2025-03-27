import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  const WeatherForecastItem({
    super.key,
    this.weather,
    this.icon,
    this.prefixIcon,
    this.prefix,
  });

  final String? weather;
  final IconData? icon;
  final IconData? prefixIcon;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
      child: Container(
        height: 50,
        color: const Color.fromARGB(255, 97, 153, 238),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon ?? Icons.circle,
                  color: const Color.fromARGB(255, 175, 204, 230),
                ),
                SizedBox(width: 10),
                Text(weather ?? "N/A", style: TextStyle(color: Colors.white)),
              ],
            ),
            //Icon(prefixIcon ?? Icons.map),
            Text(prefix ?? "12/23", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
