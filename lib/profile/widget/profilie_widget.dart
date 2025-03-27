import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, this.weather, this.icon, this.prefixIcon});

  final String? weather;
  final IconData? icon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(prefixIcon ?? Icons.map),
          //Text(prefix ?? "12/23", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
