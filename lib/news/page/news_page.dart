import 'package:flutter/material.dart';
import 'package:my_profile/Discover/model/news_data_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List categoryList = [
    "all news",

    "Politics",
    "Business",
    "Technology",
    "Science",
    "Education",
    "Opinnion",
  ];

  List<NewsDataModel> sliderlist = [
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/twelve.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/eleven.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/thirteen.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/fourteen.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/fifteen.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/sixteen.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,

        title: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 223, 65, 8),
          ),
          child: Text(
            'OXUBZ',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 10),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      padding: EdgeInsets.all(10),

                      color: const Color.fromARGB(255, 51, 53, 54),
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 238, 236, 236),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: categoryList.length,
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 10),
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
                        image: AssetImage(sliderlist[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              sliderlist[index].title,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              sliderlist[index].description,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              sliderlist[index].publishertime,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: sliderlist.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest news',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 17, 16, 16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15000,
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
                              color: const Color.fromARGB(255, 9, 92, 143),
                              image: DecorationImage(
                                image: AssetImage(sliderlist[index].image),
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
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  sliderlist[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                      255,
                                      16,
                                      16,
                                      16,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  sliderlist[index].description,

                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      18,
                                      18,
                                      18,
                                    ),
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
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          sliderlist[index].publishertime,
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              12,
                                              12,
                                              12,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '+',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              14,
                                              13,
                                              13,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              sliderlist[index].author,
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                  255,
                                                  19,
                                                  19,
                                                  19,
                                                ),
                                              ),
                                            ),
                                          ],
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
                  (context, index) => SizedBox(width: 12, height: 10),

              itemCount: sliderlist.length,
            ),
          ),
        ],
      ),
    );
  }
}
