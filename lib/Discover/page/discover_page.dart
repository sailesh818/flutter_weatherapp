import 'package:flutter/material.dart';
import 'package:my_profile/Discover/model/news_data_model.dart';
//import 'package:my_profile/dispalyhomepage/page/dispalypage2.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List categoryList = [
    "all",
    "sports",
    "Politics",
    "Entertainment",
    "Technology",
    "Science",
    "Education",
  ];

  List<NewsDataModel> sliderlist = [
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/one.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Mbape lottery',
      description: 'He hit the loss',
      image: 'assets/two.jpg',
      publishertime: '19:24',
      author: 'deadly day',
      activeusers: 96,
    ),
    NewsDataModel(
      title: 'Rayane mayane glory at ',
      description: 'He dug the earth out from the universe',
      image: 'assets/three.jpg',
      publishertime: '11:24',
      author: 'walking dead',
      activeusers: 54,
    ),
    NewsDataModel(
      title: 'Calling all the day out',
      description: 'Ucl news has been remebered all',
      image: 'assets/four.jpg',
      publishertime: '6:24',
      author: 'Running nose',
      activeusers: 34,
    ),
    NewsDataModel(
      title: 'Futsal',
      description: 'Its popularity hasbeen growing',
      image: 'assets/five.jpg',
      publishertime: '7:24',
      author: 'daily days',
      activeusers: 995,
    ),
    NewsDataModel(
      title: 'Nobody dares to move',
      description: 'Calling all the day out',
      image: 'assets/six.jpg',
      publishertime: '9:24',
      author: 'calling',
      activeusers: 2378,
    ),
    NewsDataModel(
      title: 'Hoping the new',
      description: 'Its begining to bring the glory',
      image: 'assets/seven.jpg',
      publishertime: '10:24',
      author: 'beam Radioboy',
      activeusers: 903,
    ),
    NewsDataModel(
      title: 'Sunlight',
      description: 'was he the one?',
      image: 'assets/eight.jpg',
      publishertime: '3:24',
      author: 'moonlight Radioboy',
      activeusers: 67,
    ),
    NewsDataModel(
      title: 'moonlight in the dimlight',
      description: 'its beautiful night to begin the day',
      image: 'assets/nine.jpg',
      publishertime: '1:24',
      author: 'happy Radioboy',
      activeusers: 89,
    ),
    NewsDataModel(
      title: 'calling the day',
      description: 'it has been all day out',
      image: 'assets/ten.jpg',
      publishertime: '15:267',
      author: 'Radioboy in husk',
      activeusers: 98,
    ),
  ];

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
      body: ListView(
        children: [
          SizedBox(
            height: 40,
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
          SizedBox(height: 10),
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
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      'See more',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 90,

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
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(sliderlist[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 1),
              itemCount: sliderlist.length,
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Most Read',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 246, 243, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'See more',
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 246, 243, 243),
                    fontWeight: FontWeight.normal,
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
                                    color: Colors.white,
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
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          sliderlist[index].publishertime,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '+',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              sliderlist[index].author,
                                              style: TextStyle(
                                                color: Colors.white,
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
