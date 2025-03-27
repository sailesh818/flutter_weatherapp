import 'package:flutter/material.dart';
import 'package:my_profile/Discover/model/news_data_model.dart';
//import 'package:my_profile/profile/page/profile_page.dart';
//import 'package:my_profile/Discover/model/news_data_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.title});

  final String? title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final argumentData =
        ModalRoute.of(context)?.settings.arguments as NewsDataModel;
    return Scaffold(
      appBar: AppBar(title: Text("${argumentData.title} ")),
      body: Column(
        children: [
          Image.asset(argumentData.image),
          Text("${argumentData.title} "),
          Text("${argumentData.description} "),
        ],
      ),
    );
  }
}
