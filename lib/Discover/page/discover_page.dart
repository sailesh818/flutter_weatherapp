import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_profile/Discover/model/news_data_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int currentIndex = 0;
  List<String> categoryList = [
    "all",
    "sports",
    "Politics",
    "Entertainment",
    "Technology",
    "Science",
    "Education",
  ];

  List<NewsDataModel> sliderlist = [];

  Future<void> fetchNewsData() async {
    final response = await http.get(Uri.parse('https://example.com/news'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      setState(() {
        sliderlist =
            data
                .map((item) => NewsDataModel.fromJson(item))
                .cast<NewsDataModel>()
                .toList();
      });
    } else {
      throw Exception('Failed to load news data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 1, 30),
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/one.jpg'),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 7, 1, 30),
        title: const Text(
          'Discover Page',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body:
          sliderlist.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(10),
                              color:
                                  currentIndex == index
                                      ? Colors.amber
                                      : const Color.fromARGB(255, 51, 53, 54),
                              child: Text(
                                categoryList[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 238, 236, 236),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 5),
                      itemCount: categoryList.length,
                    ),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: sliderlist[index],
                            );
                          },
                          child: Container(
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 9, 92, 143),
                              image: DecorationImage(
                                image: NetworkImage(sliderlist[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  sliderlist[index].title,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  sliderlist[index].description,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  sliderlist[index].publishertime,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 5),
                      itemCount: sliderlist.length,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Explore',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: sliderlist[index],
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(sliderlist[index].image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 1),
                      itemCount: sliderlist.length,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Most Read',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 246, 243, 243),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 246, 243, 243),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1500,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: sliderlist[index],
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                        255,
                                        9,
                                        92,
                                        143,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          sliderlist[index].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          sliderlist[index].title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          sliderlist[index].description,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  sliderlist[index]
                                                      .publishertime,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Text(
                                                  '+',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  sliderlist[index].author,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: 12, height: 10),
                      itemCount: sliderlist.length,
                    ),
                  ),
                ],
              ),
    );
  }
}
